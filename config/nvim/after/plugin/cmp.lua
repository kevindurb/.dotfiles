local cmp = require('cmp')
local lspkind = require('lspkind')

local highlight_groups = {
  PmenuSel = {bg = "#282C34", fg = "NONE"},
  Pmenu = {fg = "#C5CDD9", bg = "#22252A"},

  CmpItemAbbrDeprecated = {fg = "#7E8294", bg = "NONE", strikethrough = true},
  CmpItemAbbrMatch = {fg = "#82AAFF", bg = "NONE", bold = true},
  CmpItemAbbrMatchFuzzy = {fg = "#82AAFF", bg = "NONE", bold = true},
  CmpItemMenu = {fg = "#C792EA", bg = "NONE", italic = true},

  CmpItemKindField = {fg = "#EED8DA", bg = "#B5585F"},
  CmpItemKindProperty = {fg = "#EED8DA", bg = "#B5585F"},
  CmpItemKindEvent = {fg = "#EED8DA", bg = "#B5585F"},

  CmpItemKindText = {fg = "#C3E88D", bg = "#9FBD73"},
  CmpItemKindEnum = {fg = "#C3E88D", bg = "#9FBD73"},
  CmpItemKindKeyword = {fg = "#C3E88D", bg = "#9FBD73"},

  CmpItemKindConstant = {fg = "#FFE082", bg = "#D4BB6C"},
  CmpItemKindConstructor = {fg = "#FFE082", bg = "#D4BB6C"},
  CmpItemKindReference = {fg = "#FFE082", bg = "#D4BB6C"},

  CmpItemKindFunction = {fg = "#EADFF0", bg = "#A377BF"},
  CmpItemKindStruct = {fg = "#EADFF0", bg = "#A377BF"},
  CmpItemKindClass = {fg = "#EADFF0", bg = "#A377BF"},
  CmpItemKindModule = {fg = "#EADFF0", bg = "#A377BF"},
  CmpItemKindOperator = {fg = "#EADFF0", bg = "#A377BF"},

  CmpItemKindVariable = {fg = "#C5CDD9", bg = "#7E8294"},
  CmpItemKindFile = {fg = "#C5CDD9", bg = "#7E8294"},

  CmpItemKindUnit = {fg = "#F5EBD9", bg = "#D4A959"},
  CmpItemKindSnippet = {fg = "#F5EBD9", bg = "#D4A959"},
  CmpItemKindFolder = {fg = "#F5EBD9", bg = "#D4A959"},

  CmpItemKindMethod = {fg = "#DDE5F5", bg = "#6C8ED4"},
  CmpItemKindValue = {fg = "#DDE5F5", bg = "#6C8ED4"},
  CmpItemKindEnumMember = {fg = "#DDE5F5", bg = "#6C8ED4"},

  CmpItemKindInterface = {fg = "#D8EEEB", bg = "#58B5A8"},
  CmpItemKindColor = {fg = "#D8EEEB", bg = "#58B5A8"},
  CmpItemKindTypeParameter = {fg = "#D8EEEB", bg = "#58B5A8"}
}

for key, value in pairs(highlight_groups) do vim.api.nvim_set_hl(0, key, value) end

cmp.setup {
  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item({
      behavior = cmp.SelectBehavior.Insert
    }), {'i'}),
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Insert
    }), {'i'}),
    ['<C-Space>'] = cmp.mapping.confirm({select = true})
  },
  sources = {
    {name = "nvim_lsp"}, {name = "path"}, {name = "buffer", keyword_length = 5}
  },
  experimental = {ghost_text = {hl_group = "NonText"}},
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0
    }
  },
  formatting = {
    fields = {"kind", "abbr", "menu"},
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({mode = "symbol_text", maxwidth = 50})(
                     entry, vim_item)
      local strings = vim.split(kind.kind, "%s", {trimempty = true})
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"
      return kind
    end
  }
}
