noremap <buffer> K :TernDoc<CR>
noremap <buffer> <Leader>jt :TernType<CR>
noremap <buffer> <Leader>jd :TernDef<CR>
noremap <buffer> <Leader>js :TernDefSplit<CR>
noremap <buffer> <Leader>jr :TernRename<CR>
noremap <buffer> <Leader>ju :TernRefs<CR>

nmap <silent> <Leader>d ?function<cr>:noh<cr><Plug>(jsdoc)
