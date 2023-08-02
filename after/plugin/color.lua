--vim.g.tokyonight_transparent_sidebar = true
--vim.g.tokyonight_transparent = true
--vim.opt.background = "dark"
require('rose-pine').setup({
})

function ColorMyPencils(color)
  color = color or "everforest"
  vim.cmd.colorscheme(color)  
  
end

ColorMyPencils()
