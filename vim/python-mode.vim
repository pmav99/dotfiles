" Modeline and notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" Set defaults {
    " Set default pymode python options
    " let g:pymode_options = 1
" }

" Show documentation plugin {
    " Load plugin
    let g:pymode_doc = 1

    " Key for show python documentation
    let g:pymode_doc_key = 'K'
" }

" Run python code plugin {
    " Load plugin
    let g:pymode_run = 1

    " Key for run python code
    let g:pymode_run_key = '<leader>r'
" }

" Breakpoint plugin {
    " Load breakpoints plugin
    let g:pymode_breakpoint = 1

    " Key for set/unset breakpoint
    let g:pymode_breakpoint_key = '<leader>b'
" }

" PyLint code plugin {
    " Load pylint code plugin
    let g:pymode_lint = 1

    " Switch pylint, pyflakes, pep8, mccabe code-checkers
    " Can have multiply values "pylint,pep257,pep8,pyflakes,mcccabe"
    let g:pymode_lint_checker = "pylint,mccabe"

    " Skip errors and warnings
    " E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and etc
    let g:pymode_lint_ignore="E501,W601,C0301"

    " Select errors and warnings
    " E.g. "E4,W"
    let g:pymode_lint_select = ""

    " Run linter on the fly
    let g:pymode_lint_onfly = 0

    " Pylint configuration file
    " If file not found use 'pylintrc' from python-mode plugin directory
    let g:pymode_lint_config = "./pylintrc"

    " Check code every save
    let g:pymode_lint_write = 0

    " Auto open cwindow if errors be finded
    let g:pymode_lint_cwindow = 1

    " Show error message if cursor placed at the error line
    let g:pymode_lint_message = 1

    " Auto jump on first error
    let g:pymode_lint_jump = 0

    " Hold cursor in current window
    " when quickfix is open
    let g:pymode_lint_hold = 0

    " Place error signs
    let g:pymode_lint_signs = 1

    " Maximum allowed mccabe complexity
    let g:pymode_lint_mccabe_complexity = 8

    " Minimal height of pylint error window
    let g:pymode_lint_minheight = 3

    " Maximal height of pylint error window
    let g:pymode_lint_maxheight = 10
" }

" Code folding, whitespace and indentation {
    " Enable python folding
    let g:pymode_folding = 1

    " Autoremove unused whitespaces
    let g:pymode_utils_whitespaces = 1

    " Enable pymode indentation
    let g:pymode_indent = 1

" }

" Vim python motions and operators {
    " Enable python objects and motion
    let g:pymode_motion = 1
" }

" Virtualenv support {
    " Auto fix vim python paths if virtualenv enabled
    let g:pymode_virtualenv = 1
" }

" Syntax highlight {
    " Enable pymode's custom syntax highlighting
    let g:pymode_syntax = 1

    " Enable all python highlightings
    let g:pymode_syntax_all = 1

    " Highlight "print" as function
    let g:pymode_syntax_print_as_function = 1

    " Highlight indentation errors
    let g:pymode_syntax_indent_errors = g:pymode_syntax_all

    " Highlight trailing spaces
    let g:pymode_syntax_space_errors = g:pymode_syntax_all

    " Highlight string formatting
    let g:pymode_syntax_string_formatting = g:pymode_syntax_all

    " Highlight str.format syntax
    let g:pymode_syntax_string_format = g:pymode_syntax_all

    " Highlight string.Template syntax
    let g:pymode_syntax_string_templates = g:pymode_syntax_all

    " Highlight doc-tests
    let g:pymode_syntax_doctests = g:pymode_syntax_all

    " Highlight builtin objects (__doc__, self, etc)
    let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

    " Highlight builtin functions
    let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

    " Highlight exceptions
    let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

    " For fast machines
    let g:pymode_syntax_slow_sync = 0
" }

" Rope refactoring library {
    " Load rope plugin
    let g:pymode_rope = 0

    " Auto create and open ropeproject
    let g:pymode_rope_auto_project = 1

    " Enable autoimport
    let g:pymode_rope_enable_autoimport = 1

    " Auto generate global cache
    let g:pymode_rope_autoimport_generate = 1

    let g:pymode_rope_autoimport_underlineds = 0

    let g:pymode_rope_codeassist_maxfixes = 10

    let g:pymode_rope_sorted_completions = 1

    let g:pymode_rope_extended_complete = 1

    let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]

    let g:pymode_rope_confirm_saving = 1

    let g:pymode_rope_global_prefix = "<C-x>p"

    let g:pymode_rope_local_prefix = "<C-c>r"

    let g:pymode_rope_vim_completion = 1

    let g:pymode_rope_guess_project = 1

    let g:pymode_rope_goto_def_newwin = ""

    let g:pymode_rope_always_show_complete_menu = 0
" }

" Misc {
    " Additional python paths
    let g:pymode_paths = []
" }
