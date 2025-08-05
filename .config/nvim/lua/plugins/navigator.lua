return {
  'numToStr/Navigator.nvim',
  lazy = true,
  event = "VeryLazy",
  keys = {
    { "<c-h>", "<cmd>NavigatorLeft<cr>",  { silent = true, desc = "navigate left" } },
    { "<c-j>", "<cmd>NavigatorDown<cr>",  { silent = true, desc = "navigate down" } },
    { "<c-k>", "<cmd>NavigatorUp<cr>",    { silent = true, desc = "navigate up" } },
    { "<c-l>", "<cmd>NavigatorRight<cr>", { silent = true, desc = "navigate right" } },
  },
  opts = {},
}
