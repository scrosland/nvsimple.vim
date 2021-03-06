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

" --- Public API ---

" Opens a file system browser.
function! nvsimple#browse()
  if !s:check_directory() | return | endif
  call nvsimple#command#browse()
endfunction

" Searches all notes files for pattern. Prompts if argument is empty.
function! nvsimple#search(pattern)
  if !s:check_directory() | return | endif
  let l:pattern = a:pattern
  if strlen(l:pattern) == 0
    let l:pattern = nvsimple#util#input('Enter search: ', '')
  endif
  if strlen(l:pattern) == 0
    call nvsimple#command#browse()
  else
    call nvsimple#command#search(pattern)
  endif
endfunction

" Create or edit a named note. If the filename argument does not
" already contain an extension, this appends g:nvsimple_default_extension.
function! nvsimple#open(bang, filename)
  if &mod && a:bang != '!'
    echom "No write since last change (add ! to override)"
    return 0
  endif
  if !s:check_directory() | return | endif
  silent! execute 'lcd ' . nvsimple#util#directory()
  let l:filename = a:filename
  if strlen(l:filename) == 0
    let l:filename = nvsimple#util#input('File name: ', 'file')
  endif
  if strlen(l:filename) == 0
    call nvsimple#command#browse()
  endif
  if nvsimple#util#has_extension(l:filename) == 0
    let l:filename .= g:nvsimple_default_extension
  endif
  call nvsimple#command#edit(a:bang, l:filename)
endfunction

"  -------------------------------------------------------------------------

function! s:check_directory()
  if !isdirectory(expand(g:nvsimple_notes_directory))
    echom "Notes directory: '".g:nvsimple_notes_directory."' does not exist"
    return 0
  endif
  return 1
endfunction

