-- "gc" to comment visual regions/lines
return {
	"numToStr/Comment.nvim",
	config = function()
		local comment = require("Comment")
		comment.setup({
			toggler = {
				block = "gB",
			},
			opleader = {
				block = "gB",
			},
       mappings = {
         ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
         basic = false,
          ---Extra mapping; `gco`, `gcO`, `gcA`
         extra = false,
      },
		})
	end,
	opts = {},
}
