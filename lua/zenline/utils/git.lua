-- Get the current git status branch + diff summary
local  function get_status()
  local status = vim.b.gitsigns_status_dict or {head = '', added = 0, changed = 0, removed = 0}
  local has_head = status.head ~= ''

  if not has_head then
      return ''
  end
  return string.format('  %s | +%s ~%s -%s ',
                       status.head,
                       status.added,
                       status.changed,
                       status.removed)
end

return {
    get_status = get_status,
}
