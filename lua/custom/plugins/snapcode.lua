return {
  "mistricky/codesnap.nvim",
  build = "make",
  keys = {
    { "<leader>sc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>ss", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    save_path = "~/Pictures/snapcode",
    has_breadcrumbs = false,
    watermark = "",
    bg_theme = "grape",
    bg_padding = 30,
  },
}
