set nu "行号
syntax on "语法高亮
filetype on "文件类型识别

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

" 主题商店
Plug 'flazz/vim-colorschemes'
call plug#end()
