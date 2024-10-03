-- This plugin enables you to easily manipulate pairs of "surroundings" (like quotes, parentheses, and brackets) in Vim.
-- default keybindings: cs, ds, ysiw, yss, yss
-- Examples:
--    cs"' -> "Hello" -> 'Hello'
--    ds" -> "Hello" -> Hello
--    ysiw] -> Hello -> [Hello]
--    yss) -> Hello -> (Hello)
--    yss<tab> -> Hello -> <tab>Hello<tab>
--    viwS" -> Hello -> "Hello"

return {
	"tpope/vim-surround",
}
