require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "typescript",
    "javascript",
  },
  sync_install = false,
  auto_install = true,

  highlight = { enable = true, additional_vim_regex_highlighting = false },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.groovy = {
  install_info = {
    url = "https://github.com/Decodetalkers/tree-sitter-groovy.git",
    files = { "src/parser.c" },
    -- optional entries:
    branch = "gh-pages", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
}

parser_config.openscad = {
  install_info = {
    url = "https://github.com/bollian/tree-sitter-openscad",
    files = { "src/parser.c" },
    -- optional entries:
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
}
