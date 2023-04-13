# zenline.nvim

My own Neovim status line.

## Install

### With packer.nvim

```lua
use {'lewis6991/gitsigns.nvim'} -- zenline dep
use {'nvim-lua/plenary.nvim'} -- gitsigns dep

use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
} -- nvim-navic dep

use {'qrasmont/zenline.nvim'}

```

## TODO
 - [ ] Remove gitsigns dependency
