"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	常规配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu "行号
syntax on "语法高亮
filetype on "文件类型识别
set tabstop=4 " 设置缩进
" colorscheme hybird "主题
set hlsearch 	"高亮搜索

filetype plugin indent on " 自动排版
set cindent shiftwidth=4 " 自动排版缩进

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

" Python IDE
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'tpope/vim-commentary'	" 注释
Plug 'majutsushi/tagbar'	" Tag

" Tag文件自动加载和更新
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'ludovicchabant/vim-gutentags'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	插件映射
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""NERDTree"""""""""""""""""""""""""""""""""""
nnoremap <leader>v :NERDTreeFind<cr>	" 在目录树中显示此文件 
nnoremap <leader>g :NERDTreeToggle<cr>	"  打开/关闭NERDTree
nnoremap <F2> :NERDTreeToggle<cr>	" 打开/关闭NERDTree

let g:NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=0	"是否显示隐藏文件
let NERDTreeIgnore=[
	\'\.git$','\.hg$','\.svn$','\.stversions$','\.pyc$','\.pyo$','\.swp$',
	\'\.DS_Store$','\.sass-cache$','__pycache__$','\.egg-info$','\.ropeproject$',
	\]	"不需要显示的隐藏文件

"""""""""""""""""""""""""""CtrlP""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_custom_ignore = {
	\'dir': '\v[\/]\.(git|hg|svn)',
	\'file': '\v\.(exe|so|dll|swp|pyc|pyo)'
	\}
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else	
	let g:ctrlp_user_command = ['.git','cd %s && git ls-files . -co --exclude-standard','find %s -type f']
endif
""""""""""""""""""""""""""EasyMotion"""""""""""""""""""""""""""""""""""
nmap ss <Plug>(easymotion-s2) " 快速搜索

"""""""""""""""""""""""""Python-Mode"""""""""""""""""""""""""""""""""""

let g:pymode_python = 'python3'	"支持python3编译器
let g:pymode_trim_whitespaces = 1 " 保存文件时删除无用空白符
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_rope_goto_definition_bind='<C-]>'
let g:pymode_lint = 1
let g:pymode_lint_checkers=['pyflakes', 'pep8','mccabe','pylint']
let g:pymode_options_max_line_length = 120	" 最长行长

nnoremap <leader>t :TagbarToggle<cr> " Tag映射

"""""""""""""""""""""""""Tag"""""""""""""""""""""""""""""""""""""""""
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
