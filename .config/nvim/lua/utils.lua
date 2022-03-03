local tree = {}

-- Function to toggle nvim-tree with barbar active
tree.toggle = function()
  require('nvim-tree').toggle()
  -- if require('nvim-tree.view').win_open() then
  if require('nvim-tree.view').is_visible() then
    local tree_width = require('nvim-tree.view').View.width
    require('bufferline.state').set_offset(tree_width + 1, 'Nvim-Tree')
    require('nvim-tree').find_file(true)
  else
    require('bufferline.state').set_offset(0)
  end
end

return tree
