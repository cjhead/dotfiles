local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
  return
end

neotree.setup({
  -- popup_border_style = "double",
})
