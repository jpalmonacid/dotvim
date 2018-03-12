" Offline PHP documentation manual pages from the PEAR package
set keywordprg=pman
autocmd FileType php setlocal omnifunc=phpactor#Complete

" ------  php-namespace  ------
if !exists('*IPhpInsertUse')
    function! IPhpInsertUse()
        call PhpInsertUse()
        call feedkeys('a',  'n')
    endfunction
endif

inoremap <buffer> <Leader>u <Esc>:call IPhpInsertUse()<CR>
noremap <buffer> <Leader>u :call PhpInsertUse()<CR>

if !exists('*IPhpExpandClass')
    function! IPhpExpandClass()
        call PhpExpandClass()
        call feedkeys('a', 'n')
    endfunction
endif

" inoremap <buffer> <Leader>e <Esc>:call IPhpExpandClass()<CR>
" noremap <buffer> <Leader>e :call PhpExpandClass()<CR>

inoremap <buffer> <Leader>su <Esc>:call PhpSortUse()<CR>
noremap <buffer> <Leader>su :call PhpSortUse()<CR>

" ------  PDV - phpDocumentor for Vim  ------
nnoremap <buffer> <Leader>d :call pdv#DocumentWithSnip()<CR>

" ------  PHP Code Style Fixer ------
nnoremap <buffer> <silent> <Leader>fd :call PhpCsFixerFixDirectory()<CR>
nnoremap <buffer> <silent> <Leader>ff :call PhpCsFixerFixFile()<CR>

" ------  Php Refactoring Toolbox  ------
nnoremap <buffer> <Leader>rv :call PhpRenameLocalVariable()<CR>
nnoremap <buffer> <Leader>rp :call PhpRenameClassVariable()<CR>
nnoremap <buffer> <Leader>rm :call PhpRenameMethod()<CR>
" nnoremap <buffer> <Leader>eu :call PhpExtractUse()<CR>
vnoremap <buffer> <Leader>rec :call PhpExtractConst()<CR>
nnoremap <buffer> <Leader>rep :call PhpExtractClassProperty()<CR>
vnoremap <buffer> <Leader>rem :call PhpExtractMethod()<CR>
" nnoremap <buffer> <Leader>rcp :call PhpCreateProperty()<CR>
nnoremap <buffer> <Leader>rdu :call PhpDetectUnusedUseStatements()<CR>
" vnoremap <buffer> <Leader>r== :call PhpAlignAssigns()<CR>
" nnoremap <buffer> <Leader>rsg :call PhpCreateSettersAndGetters()<CR>
nnoremap <buffer> <Leader>rcg :call PhpCreateGetters()()<CR>
" nnoremap <buffer> <Leader>rda :call PhpDocAll()<CR>

" ------  PHPUnit ------
nnoremap <Leader>us :PHPUnitSwitchFile<CR>
nnoremap <Leader>ur :PHPUnitRunCurrentFile<CR>
