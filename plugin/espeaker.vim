function! Speak(text)
let firstarg=a:text
let g:espeaker_speed = get(g:, 'espeaker_speed', 200)
let punct = '"''$@#!.[\"]{}()_-/\\<>~,:;+-*\`%^&"'
let command='espeak -s ' . g:espeaker_speed .' --punct=' . punct .' &'
echom system(command, firstarg)
endfunction


function! SpeakLine()
let line=getline('.')
call Speak(line)
endfunction


function! SpeakStatus()
call Speak(line('.') . ' '. virtcol('.') . ' ')
endfunction

function! SpeakChar()
call Speak(matchstr(getline('.'), '\%' . col('.') . 'c.'))
endfunction

function! SpeakWord()
call Speak(expand("<cword>"))
endfunction
