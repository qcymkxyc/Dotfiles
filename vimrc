""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	常规配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu "行号
syntax on "语法高亮
filetype on "文件类型识别
" colorscheme hybird "主题
set hlsearch 	"高亮搜索
" set foldmethod indent 	"折叠方式

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	按键映射
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','	"leader键

"""""""""""""""""""""""""""""""""insert""""""""""""""""""""""""""""""
inoremap jj <Esc>

"""""""""""""""""""""""""""""""""normal""""""""""""""""""""""""""""""

nnoremap <C-d> dd " 删除整行映射


com! FormatJSON %!python3 -m json.tool	#json文件格式化
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" 高亮
Plug 'itchyny/lightline.vim'
" docker-compose
Plug 'skanehira/docker-compose.vim'

" 开屏
Plug 'mhinz/vim-startify'

" 状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 添加代码缩进线
Plug 'yggdroot/indentline'

" 文件目录树
Plug 'scrooloose/nerdtree'

" 快速搜索
Plug 'kien/ctrlp.vim'

" 快速定位
Plug 'easymotion/vim-easymotion'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Autopep8
Plug 'tell-k/vim-autopep8'

" 主题商店
Plug 'flazz/vim-colorschemes'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	插件映射
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""NERDTree"""""""""""""""""""""""""""""""""""
nnoremap <leader>v :NERDTreeFind<cr>	" 在目录树中显示此文件 
nnoremap <leader>g :NERDTreeToggle<cr>	" 
let NERDTreeShowHidden=1	"显示隐藏文件
let NERDTreeIgnore=[
	\'\.git$','\.hg$','\.svn$','\.stversions$','\.pyc$','\.pyo$','\.swp$',
	\'\.DS_Store$','\.sass-cache$','__pycache__$','\.egg-info$','\.ropeproject$',
	\]	"不需要显示的隐藏文件

"""""""""""""""""""""""""""CtrlP""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
