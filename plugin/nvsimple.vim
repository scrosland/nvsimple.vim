"
" The MIT License (MIT)
" 
" Copyright (c) 2014 Simon Crosland
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

if exists("g:loaded_nvsimple_plugin") || &cp
  finish
endif

let g:loaded_nvsimple_plugin = 1
let g:nvsimple_version = '0.1.5'

let s:keepcpo = &cpo
set cpo&vim

if !exists("g:nvsimple_notes_directory")
  if has("win32")
    let g:nvsimple_notes_directory = "$USERPROFILE/Documents/notes"
  else
    let g:nvsimple_notes_directory = "$HOME/notes"
  endif
endif

if !exists("g:nvsimple_default_extension")
  let g:nvsimple_default_extension = ".txt"
endif

" Set this to override the default detection of directory browser
" let g:nvsimple_browser = ':NERDTree'

" User commands
command! -nargs=? Nv call nvsimple#search(<q-args>)
command! -nargs=? -bang Nvopen call nvsimple#open(<q-bang>, <q-args>)

let &cpo = s:keepcpo
unlet s:keepcpo
