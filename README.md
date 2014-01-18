# nvsimple.vim

### A poor man's Notational Velocity.

## About

nvSimple is a poor man's imitation of [Notational Velocity][nv] or
[nvALT][nvAlt], as a pure-vimscript plugin for [vim][vim].

nvSimple is a way to maintain a flat directory of plain text notes with easy
full text search, and quick access.

nvSimple is based on an idea by [Ellen Gummesson][ellen].

nvSimple makes use of vimgrep and the quickfix list, and so is immediately
familiar to any vim user.

[nv]: http://notational.net/
[nvALT]: http://brettterpstra.com/projects/nvalt/
[vim]: http://www.vim.org
[ellen]: http://ellengummesson.com/blog/2013/07/29/a-poor-mans-notational-velocity-resophnotes-vim-alternative/

## Installing

It is recommended to install nvSimple via [Pathogen][pathogen],
[Vundle][vundle] or one of the other modern package managers for vim.

Add this to your .vimrc:

    " load nvSimple
    Bundle 'scrosland/nvsimple.vim'

    " configure the directory in which notes are stored
    let l:gnvsimple_notes_directory = '~/notes'

[pathogen]: https://github.com/tpope/vim-pathogen
[vundle]: https://gitub.com/gmarik/vundle

## Using

The interface to nvSimple is two commands, `:Nv` and `:Nvopen`.

    :Nv [pattern]

Search or browse for notes.

If _pattern_ is not supplied, the command prompts for a `vimgrep`-style search
pattern. Entering an empty search pattern will open a directory browser in
your notes directory, as configured with `g:nvsimple_notes_directory`.

Searches all notes for _pattern_ using `vimgrep`, and then opens the
results in the `quickfix` window via the `copen` command. The search will
include all notes files whether they have the default extension or not.

    :Nvopen
    :Nvopen a-new-note
    :Nvopen a-new-todo.taskpaper

Opens an existing note or creates a new note.

If a name is not supplied, the command prompts for the name.

If the name does not include an extension (e.g. `.txt`) the default file
extension will be appended from the `g:nvsimple_default_extension`
option.

## Further information

See the [documentation][docs] for full details.

[docs]: https://github.com/scrosland/nvsimple.vim/blob/master/doc/nvsimple.txt
