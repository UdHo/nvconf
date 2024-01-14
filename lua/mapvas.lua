-- xx 22.1, 12.1xx
local M = {}

M.ns_id = nil
M.highlight_enabled = false
M.hl_group = "HighlightMapvas"
M.hl_group_special = "HighlightMapvasCursor"
M.mapcat = "mapcat"

--local coordinate_pattern = "()(-?1?%d?%d%.%d+, ?%-?1?%d?%d%.%d+)()"
local coordinate_pattern = "()()(-?1?%d?%d%.%d+)(), ?()(%-?1?%d?%d%.%d+)()()"

local function get_line(line_number)
  if line_number == nil then
    line_number = select(1, unpack(vim.api.nvim_win_get_cursor(0)))
  end
  return vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]
end

local function find_coordinate_places(line, column, replace_opts)
  print(line)
  for start_hl, start_lat, _, end_lat, start_lon, _, end_lon, end_hl in string.gmatch(line, coordinate_pattern) do
    vim.print(start_lat, end_lat, start_lon, end_lon)
    if start_lat < column and column < end_lon then
      if
        replace_opts ~= nil
        and replace_opts["line_nr"] ~= nil
        and replace_opts["lat"] ~= nil
        and replace_opts["lon"] ~= nil
      then
        vim.print("XXX")
        vim.api.nvim_buf_set_text(
          0,
          replace_opts["line_nr"],
          start_lon - 1,
          replace_opts["line_nr"],
          end_lon - 1,
          { replace_opts["lon"] }
        )
        vim.api.nvim_buf_set_text(
          0,
          replace_opts["line_nr"],
          start_lat - 1,
          replace_opts["line_nr"],
          end_lat - 1,
          { replace_opts["lat"] }
        )
      end
      return start_hl, end_hl
    end
  end
end

local function test()
  local replace = {}
  replace["line_nr"] = 0
  replace["lat"] = "22.1"
  replace["lon"] = "12.1"
  find_coordinate_places(get_line(1), 9, replace)
end

local function send_mapcat(body)
  local cmd = string.format("echo '%s' | %s", body, M.mapcat)
  os.execute(cmd)
end

local function send_line(line_number)
  send_mapcat(get_line(line_number))
end

local function send_buffer()
  local buffer_content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  send_mapcat(table.concat(buffer_content, "\n"))
end

local function get_cursorline()
  local line, column = unpack(vim.api.nvim_win_get_cursor(0))
  return vim.api.nvim_buf_get_lines(0, line - 1, line, false)[1], line, column
end

local function find_coordinate(text, cursor)
  for start, content, stop in string.gmatch(text, coordinate_pattern) do
    if start < cursor and cursor < stop - 1 then
      return start - 1, stop - 1, content
    end
  end
end

local function find_coordinates(text)
  local coordinates = {}
  for start, _, stop in string.gmatch(text, coordinate_pattern) do
    table.insert(coordinates, { start, stop })
  end
  return coordinates
end

local function line_coordinates()
  local text, line, _ = get_cursorline()
  find_coordinates(text)
end

local function set_coordinate()
  local text, line, column = get_cursorline()
  local start, stop, _ = find_coordinate(text, column)
  vim.api.nvim_buf_set_text(0, line - 1, start, line - 1, stop, { "1.0, 1.0" })
end

local function highlight_cursor_coordinate()
  local text, line, column = get_cursorline()
  local start, stop, _ = find_coordinate(text, column)
  if start == nil or stop == nil then
    return -1, -1
  end
  vim.api.nvim_buf_set_extmark(
    0,
    M.ns_id,
    line - 1,
    start,
    { end_row = line - 1, end_col = stop, hl_group = M.hl_group_special }
  )
  return line, column
end

local function highlight_line(row, bufnr)
  for _, mark in pairs(vim.api.nvim_buf_get_extmarks(0, M.ns_id, { row, 0 }, { row, -1 }, {})) do
    vim.api.nvim_buf_del_extmark(0, M.ns_id, mark[1])
  end
  local text = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1]
  for _, interval in pairs(find_coordinates(text)) do
    local start, stop = unpack(interval)
    vim.api.nvim_buf_set_extmark(
      0,
      M.ns_id,
      row,
      start - 1,
      { end_row = row, end_col = stop - 1, hl_group = M.hl_group }
    )
  end
end

local function highlight()
  if M.ns_id == nil then
    M.ns_id = vim.api.nvim_create_namespace("mapvas")
  end
  vim.api.nvim_command("highlight default HighlightMapvas guifg=#d2691e")
  vim.api.nvim_command("highlight default HighlightMapvasCursor guibg=#404060 guifg=#ff7f24")
  vim.api.nvim_set_decoration_provider(M.ns_id, {
    on_win = function(_, _, bufnr, topline, botlin)
      local cursor_line, cursor_column = highlight_cursor_coordinate()
      for i = topline, botlin do
        highlight_line(i, bufnr, cursor_line, cursor_column)
      end
      highlight_cursor_coordinate()
    end,
    on_start = function()
      if not M.highlight_enabled then
        vim.api.nvim_buf_clear_namespace(0, M.ns_id, 0, -1)
      end
      return M.highlight_enabled
    end,
  })
end

local function toggle_highlight(set_on)
  if set_on == nil then
    set_on = not M.highlight_enabled
  end
  M.highlight_enabled = set_on
  if M.ns_id == nil then
    highlight()
  end
end

M.send = send_mapcat
M.send_line = send_line
M.send_buffer = send_buffer
M.set_coordinate = set_coordinate
M.toggle_highlight = toggle_highlight
M.test = test
return M

-- Test green  -151.0, 21.0, 1.0, 1.0
