colorscheme molokai
set guifont=Courier_New:h9:b

set hlsearch                  "高亮度反白
set backspace=2               "可随时用倒退键删除
set autoindent                 "自动缩排
set ruler                      "可显示最后一行的状态
set showmode                 "左下角那一行的状态
set nu                        "可以在每一行的最前面显示行号
set bg=dark                   "显示不同的底色色调
syntax on                     "进行语法检验，颜色显示
set wrap                      "自动折行
set shiftwidth=4
set tabstop=4
set softtabstop=4
" set expandtab                  "将tab替换为相应数量空格
set smartindent

set backupcopy=yes    "建一个新的备份副本（而不是重命名原始文件），然后它将覆盖原始的file,防止windows中文件名大小写被修改

set encoding=utf8               "设置内部编码为utf8
set fileencoding=utf8            "当前编辑的文件编码
set fileencodings=uft8-bom,utf8,gbk,gb2312,big5   "打开支持编码的文件
set langmenu=zh_CN.UTF-8		"设置菜单语言以解决菜单无法正常显示的问题 在kali可能会影响输入法的快捷键,如果未设置时菜单显示正常不需要设置
set imcmdline   
source $VIMRUNTIME/delmenu.vim   
source $VIMRUNTIME/menu.vim  

"Toggle Menu and Toolbar   隐藏菜单
set guioptions-=m  
set guioptions-=T  
map <silent> <F2> :if &guioptions =~# 'T' <Bar>  
        \set guioptions-=T <Bar>  
        \set guioptions-=m <bar>  
    \else <Bar>  
        \set guioptions+=T <Bar>  
        \set guioptions+=m <Bar>  
    \endif<CR>  

filetype plugin on                                             
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

nnoremap <silent> <F5> :NERDTree<CR>
let b:match_words='\<begin\>:\<end\>' 
let NERDChristmasTree=1 " 让树更好看,我是没看出来
let NERDTreeChDirMode=1 " 改变tree目录的同时改变工程的目录

" Highlight current line 当前行、列高亮
au WinLeave * set nocursorline nocursorcolumn 
au WinEnter * set cursorline cursorcolumn 
set cursorline cursorcolumn

"ctrap  全局搜索
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"ctrlp默认会使用grep进行搜索，效率低且慢。所以，我使用了ag去替换默认的搜索 功能。ag是一款轻量级的搜索工具，速度非常快。为了集成ag，需要添加下列配置： 
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"下面状态条中会依次显示：当前模式、Git分支、文件路径、文件是否保存以及当前所载行和 列的信息。这是通过vim-powerline来实现的。其中显示Git信息需要配合vim-fugitive插件一些使用。

" set laststatus=2 " Always display the status line
" set statusline+=%{fugitive#statusline()} "  Git Hotness
