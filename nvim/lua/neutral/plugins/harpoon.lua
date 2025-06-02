-- List of favorite files/marks per project
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = { menu = { width = 120 } },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED setup
    harpoon:setup()

    -- Key mappings
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    for i = 1, 9 do
      vim.keymap.set("n", "<leader>h" .. i, function() harpoon:list():select(i) end)
    end

    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
  end,
}
