"
" The MIT License (MIT)
" 
" Copyright (c) 2016 Simon Crosland
" 
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to
" deal in the Software without restriction, including without limitation the
" rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
" sell copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
" 
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
" 
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
" FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
" IN THE SOFTWARE.
"

" Opens a file system browser.
function! nvsimple#command#browse()
  let l:command = nvsimple#util#browser()
  let l:command .= ' ' . nvsimple#util#directory()
  silent! execute l:command
endfunction

" Searches all notes files for pattern
function! nvsimple#command#search(pattern)
  let l:command = 'lcd ' . nvsimple#util#directory()
  let l:command .= ' | ' . s:grepcommand(a:pattern)
  let l:command .= ' | copen'
  echom l:command
  silent! execute l:command
endfunction

" Create or edit a named note. If the filename argument does not
" already contain an extension, this appends g:nvsimple_default_extension.
function! nvsimple#command#edit(bang, filename)
  silent! execute 'lcd ' . nvsimple#util#directory()
  call s:ensuredirectory(a:filename)
  let l:command = 'edit' . a:bang
  let l:command .= ' ' . nvsimple#util#fnameescape(a:filename) . ' | w'
  silent! execute l:command
endfunction

"  -------------------------------------------------------------------------

function! s:ensuredirectory(path)
  if fnamemodify(a:path, ':t') != a:path
    let l:dir = fnamemodify(a:path, ':h')
    if strlen(glob(l:dir)) == 0
      call mkdir(l:dir, "p")
    endif
  endif
endfunction

function! s:grepcommand(pattern)
  let l:cmd = substitute(g:nvsimple_grep_command, '\c{pattern}', a:pattern, "g")
  return substitute(l:cmd, '\c{files}', '**', "g")
endfunction
