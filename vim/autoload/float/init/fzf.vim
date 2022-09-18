function! float#init#fzf#hook_add() abort
   nnoremap [FZF] <Nop>
   nmap     [Myplug]f [FZF]

   nnoremap [FZF]f :FZFFileList<CR>
   command! FZFFileList call fzf#run({
   \  'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
   \  'sink':   'e'})

   nnoremap [FZF]r :FZFMru<CR>
   command! FZFMru call fzf#run({
   \  'source':  v:oldfiles,
   \  'sink':   'tabe',
   \  'options': '-m -x +s',
   \  'down':   '40%'})
endfunction

