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

let s:buf = expand("%:p:h")

" insert or source Cmd() function here
call system(<SID>Cmd() . " " . expand("%:p")) | bdelete s:buf | redraw! | syntax on
