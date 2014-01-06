" Statusline setup
let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [], ['fileencoding', 'filetype', 'pwd' ] ]
        \ },
        \ 'component': {
        \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
        \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
        \   'fugitive': '%{(exists("*fugitive#head") && ""!=fugitive#head())?" ".fugitive#head():""}',
        \   'pwd'     : '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'
        \ },
        \ 'component_visible_condition': {
        \   'readonly': '(&filetype!="help"&& &readonly)',
        \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
        \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }


let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction
