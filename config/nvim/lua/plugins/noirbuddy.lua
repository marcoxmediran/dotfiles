return {
    'jesseleite/nvim-noirbuddy',
    dependencies = {
        'tjdevries/colorbuddy.nvim',
    },
    lazy = false,
    priority = 1000,
    config = function()
        require('noirbuddy').setup {
            preset = 'slate',
        }
    end,
}
