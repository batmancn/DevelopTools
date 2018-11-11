"""""""""""""""""""
" batmancn use
"""""""""""""""""""

"""workspace"""
"""WebOVS"""
set tags=/srv/www/htdocs/backend/tags

set hls
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch "显示匹配
set tags=tags; "ctags
set ruler "显示当前位置
set cc=80

" delete space of tail of line when write quit "
autocmd FileType c,cpp,java,php,python,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

" high light "
nnoremap <silent> <F1> :set hlsearch<CR>
nnoremap <silent> <F2> :set nohlsearch<CR>
set hlsearch

" tab into space "
set ts=4
set expandtab
set autoindent

" syntax "
syntax enable
syntax on
colorscheme desert

" ctrl+w+l  ctrlr+w+h  to jump from windows "
" taglist "
nnoremap <silent> <F9> :TlistToggle<CR>
"nnoremap <Leader>tl :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
let Tlist_WinWidth = 40

" cscope "
if has("cscope")
	" set csprg=/usr/local/bin/cscope
	set csto=1
	set cst
	set nocsverb
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

nmap <Leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>
nmap <Leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>
nmap <Leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>
nmap <Leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>
nmap <Leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>
nmap <Leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>:bot cw<CR>
nmap <Leader>si :cs find i <C-R>=expand("<cfile>")<CR><CR>:bot cw<CR>
nmap <Leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>
nmap <silent> <Leader>u :!find . -name "*.cc" -o -name "*.hh" -o -name "*.h" -o -name "*.c" -o -name "*.inc" > cscope.files<CR>:!cscope -Rbq -i cscope.files<CR>:cscope reset<CR>:!ctags --tag-relative=yes -L cscope.files --c++-kinds=+p --fields=+iaS --extra=+q -I ~/.vim/tags_ignore<CR><CR>
nmap <silent> <Leader><Leader>u :!cscope -Rbq -i cscope.files<CR>:cscope reset<CR>:!ctags --tag-relative=yes -L cscope.files --c++-kinds=+p --fields=+iaS --extra=+q -I ~/.vim/tags_ignore<CR><CR>
