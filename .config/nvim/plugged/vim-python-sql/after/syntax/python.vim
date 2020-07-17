" Disable current syntax temporarily.
let saved_syntax = b:current_syntax
unlet! b:current_syntax

" Load SQL syntax.
syntax include @SQL syntax/sql.vim

" Restore original syntax.
let b:current_syntax = saved_syntax
unlet! saved_syntax

" Set SQL to match in any javaString that uses single quotes.
syntax region sqlSnippet matchgroup=pythonTripleQuotes start=/'''/ end=/'''/ contains=@SQL
syntax region sqlSnippet matchgroup=pythonTripleQuotes start=/f'''/ end=/'''/ contains=@SQL
