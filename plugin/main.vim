echo "Yes"

py3 import quickjump

""" quickjump config

function! VimQuickJump(cmd)
    if a:cmd == 's'
        exe 'BufferJump '. a:cmd
    elseif a:cmd == 'S'
        exe 'GlobalJump '. a:cmd
    elseif a:cmd == 't'
        exe 'WindowJump '. a:cmd
    endif
    let loop_num = 20
    while loop_num > 0
        let t = pyxeval("quickjump.State.is_stop")
        if t == 1
            break
        endif
        redraw
        QuickJump
        let loop_num = loop_num - 1
    endwhile
endfunc

function! GI()
    execute "normal `^"
    let insert_pos = getpos("'^")
    if insert_pos[2] > len(getline('.'))
        startinsert!
    else
        startinsert
    endif
endfunc

function! VimInsertQuickPeek()
    call VimQuickJump('s')
    """ normal can't go into insert mode
    execute "normal \<m-p>"
    call GI()
endfunction

nnoremap <silent> s <Cmd>call VimQuickJump('s')<cr>
nnoremap <silent> S <Cmd>call VimQuickJump('S')<cr>
nnoremap <silent> <tab> <Cmd>call VimQuickJump('t')<cr>
vnoremap <silent> s <Cmd>call VimQuickJump('s')<cr>
inoremap <silent> <m-s> <esc>:<c-u>call VimInsertQuickPeek()<esc>

""" conflict with surrounding: cs ds ys
""" the conflict make the bugs is very hard to find. so i should install less
""" scripts as i can.
""" omap: normap + visual selection.
onoremap <silent> s v<Cmd>call VimQuickJump('s')<cr>
