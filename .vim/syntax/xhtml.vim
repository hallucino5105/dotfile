if version < 508
  command! -nargs=+ HtmlHiLink hi link <args>
else
  command! -nargs=+ HtmlHiLink hi def link <args>
endif

syn keyword htmlArg2 contained data-bind
HtmlHiLink htmlArg2 htmlArg
