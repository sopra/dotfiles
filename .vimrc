" ============================================
" Antigravity & Gemini Optimized .vimrc
" ============================================

" ----- Basic Settings -----
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set number              " 行番号表示
set relativenumber      " 相対行番号
set cursorline          " カーソル行をハイライト
set showmatch           " 対応する括弧をハイライト
set matchtime=1         " showmatchの表示時間
set laststatus=2        " ステータスライン常に表示
set showcmd             " コマンドを表示
set wildmenu            " コマンドライン補完
set history=1000        " コマンド履歴

" ----- Indentation -----
set autoindent          " 自動インデント
set smartindent         " スマートインデント
set expandtab           " タブをスペースに変換
set tabstop=2           " タブの幅
set shiftwidth=2        " インデント幅
set softtabstop=2       " 

" ----- Search -----
set hlsearch            " 検索結果をハイライト
set incsearch           " インクリメンタルサーチ
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 大文字が含まれる場合は区別する
set wrapscan            " 検索がファイル末尾まで進んだら先頭に戻る

" ----- Display -----
syntax on               " シンタックスハイライト
set background=dark     " 背景色
set t_Co=256            " 256色対応
set scrolloff=5         " スクロール時の余白
set sidescrolloff=5     " 横スクロール時の余白
set list                " 不可視文字を表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

" ----- Backup -----
set nobackup            " バックアップファイルを作らない
set noswapfile          " スワップファイルを作らない
set noundofile          " undoファイルを作らない

" ----- Clipboard -----
set clipboard=unnamed   " ヤンクでクリップボードにコピー

" ----- Key Mappings -----
" Leader key
let mapleader = ","

" 保存・終了
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

" 検索ハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>

" ウィンドウ移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 行末・行頭移動
nnoremap <Leader>h ^
nnoremap <Leader>l $

" インサートモードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ----- File Type Settings -----
filetype on
filetype plugin on
filetype indent on

" Python
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4

" Makefile
autocmd FileType make setlocal noexpandtab

" Markdown
autocmd FileType markdown setlocal wrap linebreak

" ----- Status Line -----
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%04l,%04v][%p%%]

" ----- Auto Commands -----
" 最後のカーソル位置を復元
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" 保存時に行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge

" ----- Colors -----
" コメントを見やすく
highlight Comment ctermfg=cyan

" ----- Local Settings -----
" ローカル専用の設定は ~/.vimrc.local に記述
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
