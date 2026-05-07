require('nvim-rooter').setup({
  rooter_patterns = { '.git', '.hg', '.svn' },
  trigger_patterns = { '*' },
  manual = true,
  fallback_to_parent = false,
})
