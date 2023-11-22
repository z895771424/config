-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })
-- 记录当前输入法
Current_input_method = vim.fn.system("/usr/local/bin/im-select")

-- 切换到英文输入法
function Switch_to_English_input_method()
	Current_input_method = vim.fn.system("/usr/local/bin/im-select")
	if Current_input_method ~= "com.apple.keylayout.ABC\n" then
		vim.fn.system("/usr/local/bin/im-select com.apple.keylayout.ABC")
	end
end

-- 设置输入法
function Set_input_method()
	if Current_input_method ~= "com.apple.keylayout.ABC\n" then
		vim.fn.system("/usr/local/bin/im-select " .. string.gsub(Current_input_method, "\n", ""))
	end
end

-- 进入normal模式时切换为英文输入法
vim.cmd([[
augroup input_method
  autocmd!
  " autocmd InsertEnter * :lua Set_input_method()
  autocmd InsertLeave * :lua Switch_to_English_input_method()
augroup END
]])
