vim.scriptencoding = 'utf-8'

do
   local handle = io.popen('uname')
   UNAME = handle:read('*a')
   handle:close()
end
