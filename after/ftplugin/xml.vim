" Pear Tree - A painless, powerful Vim auto-pair plugin
" Maintainer: Thomas Savage <thomasesavage@gmail.com>
" Version: 0.8
" License: MIT
" Website: https://github.com/tmsvg/pear-tree
" Added XML support: Denny Li

if !exists('g:pear_tree_pairs') || get(b:, 'pear_tree_did_xml_ftplugin', 0)
    finish
endif
let b:pear_tree_did_xml_ftplugin = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

if !exists('b:undo_ftplugin')
    let b:undo_ftplugin = ''
else
    let b:undo_ftplugin .= ' | '
endif
let b:undo_ftplugin .= 'unlet! b:pear_tree_did_xml_ftplugin b:pear_tree_pairs'

let b:pear_tree_pairs = extend(deepcopy(g:pear_tree_pairs), {
            \ '<*>': {'closer': '</*>',
            \         'not_if': ['br', 'hr', 'img', 'input', 'link', 'meta',
            \                    'area', 'base', 'col', 'command', 'embed',
            \                    'keygen', 'param', 'source', 'track', 'wbr'],
            \         'not_like': '/$',
            \         'until': '[^a-zA-Z0-9-._]'
            \        }
            \ }, 'keep')

let &cpoptions = s:save_cpo
unlet s:save_cpo
