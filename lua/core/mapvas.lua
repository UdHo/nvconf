local coordinate_pattern = "()(%d?%d?%d%.%d+, ?%d?%d?%d%.%d+)()"

local function send_mapcat(body)
  vim.print(body)
  local cmd = string.format("echo '%s' | mapcat", body)
  os.execute(cmd)
end

local function get_line(line_number)
  if line_number == nil then
    line_number = select(1, unpack(vim.api.nvim_win_get_cursor(0)))
  end
  return vim.api.nvim_buf_get_lines(0, line_number - 1, line_number, false)[1]
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
  vim.print(coordinates)
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

local function set_cursorline(content)
  local line, cursor = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, line - 1, 0, line - 1, 0, { content })
end

local function highlight()
  local ns = vim.api.nvim_create_namespace("mapvas")
  vim.api.nvim_buf_add_highlight(0, ns, hlgroup)
  vim.api.set_hl(ns, "mapvas", { bold = true })
end

local M = {}
M.send = send_mapcat
M.send_line = send_line
M.send_buffer = send_buffer
M.set_coordinate = set_coordinate
M.print = line_coordinates
return M


-- Test green 221.0, 1.0, 52.12,15.1
