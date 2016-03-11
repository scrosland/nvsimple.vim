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

function! nvsimple#util#browser()
  if exists("g:nvsimple_browser") && len(g:nvsimple_browser)
    return g:nvsimple_browser
  elseif exists(":NERDTree")
    return ':NERDTree'
  else
    return ':Explore'
  endif
endfunction

function! nvsimple#util#directory()
  return nvsimple#util#fnameescape(g:nvsimple_notes_directory)
endfunction

function! nvsimple#util#fnameescape(path)
  return fnameescape(expand(a:path))
endfunction

function! nvsimple#util#input(prompt, completion)
  call inputsave()
  let l:args = [ a:prompt ]
  if strlen(a:completion) != 0
    call add(l:args, "")
    call add(l:args, a:completion)
  endif
  let l:input = call("input", l:args)
  call inputrestore()
  return l:input
endfunction

" Returns non-zero if the filename argument looks like it ends with a
" valid extension.
function! nvsimple#util#has_extension(filename)
  if strlen(a:filename) == 0
    return 0
  endif
  let l:ext = fnamemodify(a:filename, ':e')
  if strlen(l:ext) == 0 || l:ext =~ ' '
    " an 'extension' containing a space is not really a file extension
    return 0
  end
  return 1
endfunction
