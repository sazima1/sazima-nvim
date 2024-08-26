return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon").setup()
        local map = vim.keymap.set

        map("n", "<C-S-A>", function() harpoon:list():add() end)
        map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        map("n", "<C-7>", function() harpoon:list():select(1) end)
        map("n", "<C-8>", function() harpoon:list():select(2) end)
        map("n", "<C-9>", function() harpoon:list():select(3) end)
        map("n", "<C-0>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        map("n", "<C-S-P>", function() harpoon:list():prev() end)
        map("n", "<C-S-N>", function() harpoon:list():next() end)
    end
}
