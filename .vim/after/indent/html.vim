":setlocal expandtab
":setlocal tabstop=2
":setlocal shiftwidth=2
":setlocal softtabstop=2
":setlocal autoindent
":setlocal smartindent


"if exists('b:did_indent')
"    finish
"endif
"
"
"setlocal autoindent
"setlocal indentexpr=GetHtmlIndent()
"setlocal indentkeys=!^F,o,O
"
"setlocal expandtab
"setlocal tabstop<
"setlocal softtabstop=2
"setlocal shiftwidth=2
"
"let b:undo_indent = 'setlocal '.join([
"    \   'autoindent<',
"    \   'expandtab<',
"    \   'indentexpr<',
"    \   'indentkeys<',
"    \   'shiftwidth<',
"    \   'softtabstop<',
"    \   'tabstop<',
"    \ ])
"
"
"function! GetHtmlIndent()
"    return -1
"endfunction
"
"let b:did_indent = 1

