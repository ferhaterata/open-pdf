" What command to use
function! s:Cmd() abort
    " Linux/BSD
    if executable("xdg-open")
        return "xdg-open"
    endif
    " MacOS
    if executable("open")
        return "open"
    endif
    " Windows
    return "explorer"
endfunction

let s:buf = expand("%:p")
let s:cur = bufnr('%')

" insert or source Cmd() function here
call system(<SID>Cmd() . " " . expand("%:p"))

execute "bdelete " . s:cur 
" execute "redraw!" 
" execute "syntax on"
