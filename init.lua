require("config.options")
require("config.keybinds")
require("manage").setup()
require("oil").setup({
    columns = {
        "icon",
        "permissions",
        "size"
    },

    preview_win = {
        update_on_cursor_moved = true,
        preview_method = "fast_scratch",
    }
})
