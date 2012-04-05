" Vim syntax file
" Language:	SX
" Last Change:	2010 Feb 16
" Maintainer:	Geir Erikstad <geir@kvaleberg.com>
" Original author (Scheme version):	Dirk van Deun <dirk@igwe.vub.ac.be>
" Author of the SX adaptions: Geir Erikstad

" This script incorrectly recognizes some junk input as numerals:
" parsing the complete system of Scheme numerals using the pattern
" language is practically impossible: I did a lax approximation.
 
" Initializing:
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" Fascist highlighting: everything that doesn't fit the rules is an error...

syn match	sxError	oneline    ![^ \t()\[\]{}";]*!
syn match	sxError	oneline    ")"
syn match	sxError	oneline    "\]"
syn match	sxError	oneline    "}"


" using [] and {} as well as ()
"syn region sxStrucRestricted matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALLBUT,sxStruc,sxSyntax,sxFunc
"syn region sxStrucRestricted matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALLBUT,sxStruc,sxSyntax,sxFunc
"syn region sxStrucRestricted matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,sxStruc,sxSyntax,sxFunc
"syn region sxStrucRestricted matchgroup=Delimiter start="{" matchgroup=Delimiter end="}"
"contains=ALLBUT,sxStruc,sxSyntax,sxFunc
"syn region sxStrucRestricted matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALLBUT,sxStruc,sxSyntax,sxFunc

" R5RS Scheme Functions and Syntax:

if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_,/,!,?,-
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_,/,!,?,-
endif

syn keyword sxSyntax λ lambda if cond case define let 
syn keyword sxSyntax begin do delay set! else =>
syn keyword sxSyntax quote quasiquote unquote unquote-splicing
syn keyword sxSyntax define-syntax syntax-rules

syn keyword sxFunc not boolean? eq? eqv? equal? pair? cons car cdr and or
syn keyword sxFunc caar cadr cdar cddr caaar caadr cadar caddr
syn keyword sxFunc cdaar cdadr cddar cdddr caaaar caaadr caadar caaddr
syn keyword sxFunc cadaar cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr
syn keyword sxFunc cddaar cddadr cdddar cddddr null? list? list length
syn keyword sxFunc append reverse list-ref memq memv member assq assv assoc
syn keyword sxFunc symbol? symbol->string string->symbol number? complex?
syn keyword sxFunc real? rational? integer? exact? inexact? = < > <= >=
syn keyword sxFunc zero? positive? negative? odd? even? max min + * - / abs
syn keyword sxFunc quotient remainder modulo gcd lcm numerator denominator
syn keyword sxFunc floor ceiling truncate round rationalize exp log sin cos
syn keyword sxFunc tan asin acos atan sqrt expt make-rectangular make-polar
syn keyword sxFunc real-part imag-part magnitude angle exact->inexact
syn keyword sxFunc inexact->exact number->string string->number char=?
syn keyword sxFunc char-ci=? char<? char-ci<? char>? char-ci>? char<=?
syn keyword sxFunc char-ci<=? char>=? char-ci>=? char-alphabetic? char?
syn keyword sxFunc char-numeric? char-whitespace? char-upper-case?
syn keyword sxFunc char-lower-case?
syn keyword sxFunc char->integer integer->char char-upcase char-downcase
syn keyword sxFunc string? make-string string string-length string-ref
syn keyword sxFunc string-set! string=? string-ci=? string<? string-ci<?
syn keyword sxFunc string>? string-ci>? string<=? string-ci<=? string>=?
syn keyword sxFunc string-ci>=? substring string-append vector? make-vector
syn keyword sxFunc vector vector-length vector-ref vector-set! procedure?
syn keyword sxFunc apply map for-each call-with-current-continuation
syn keyword sxFunc call-with-input-file call-with-output-file input-port?
syn keyword sxFunc output-port? current-input-port current-output-port
syn keyword sxFunc open-input-file open-output-file close-input-port
syn keyword sxFunc close-output-port eof-object? read read-char peek-char
syn keyword sxFunc write display newline write-char call/cc
syn keyword sxFunc list-tail string->list list->string string-copy
syn keyword sxFunc string-fill! vector->list list->vector vector-fill!
syn keyword sxFunc force with-input-from-file with-output-to-file
syn keyword sxFunc char-ready? load transcript-on transcript-off eval
syn keyword sxFunc dynamic-wind port? values call-with-values
syn keyword sxFunc scheme-report-environment null-environment
syn keyword sxFunc interaction-environment

" so that a single + or -, inside a quoted context, would not be
" interpreted as a number (outside such contexts, it's a sxFunc)
syn match	sxOther		oneline    ![+-][ \t\[\](){}";]!me=e-1
syn match	sxOther		oneline    ![+-]$!

" and a single dot is not a number but a delimiter
syn match	sxDelimiter	oneline    !\.[ \t\[\](){}";]!me=e-1
syn match	sxDelimiter	oneline    !\.$!

" This keeps all other stuff unhighlighted, except *stuff* and <stuff>:
syn match	sxOther		oneline    ,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*,
syn match	sxError		oneline    ,[a-z!$%&*/:<=>?^_~+@#%-][-a-z!$%&*/:<=>?^_~0-9+.@#%]*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\](){}";]\+[^ \t\[\](){}";]*,

syn match	sxOther		oneline    "\.\.\."
syn match	sxError		oneline    !\.\.\.[^ \t\[\](){}";]\+!
" ... a special identifier

syn match	sxConstant	oneline    ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[ \t\[\](){}";],me=e-1
syn match	sxConstant	oneline    ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*$,
syn match	sxError		oneline    ,\*[-a-z!$%&*/:<=>?^_~0-9+.@]*\*[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\](){}";]\+[^ \t\[\](){}";]*,

syn match	sxConstant	oneline    ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[ \t\[\](){}";],me=e-1
syn match	sxConstant	oneline    ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>$,
syn match	sxError		oneline    ,<[-a-z!$%&*/:<=>?^_~0-9+.@]*>[^-a-z!$%&*/:<=>?^_~0-9+.@ \t\[\](){}";]\+[^ \t\[\](){}";]*,

" Todo and hacks:
syn keyword sxHack hack hack: todo todo: fixme fixme: note note: bug bug: contained

" Non-quoted lists, and strings:
syn region sxStruc matchgroup=Delimiter start="(" matchgroup=Delimiter end=")" contains=ALLBUT,sxHack
syn region sxStruc matchgroup=Delimiter start="\[" matchgroup=Delimiter end="\]" contains=ALLBUT,sxHack
syn region sxStruc matchgroup=Delimiter start="{" matchgroup=Delimiter end="}" contains=ALLBUT,sxHack

"syn region sxStruc matchgroup=Delimiter start="#(" matchgroup=Delimiter end=")" contains=ALL
"syn region sxStruc matchgroup=Delimiter start="#\[" matchgroup=Delimiter end="\]" contains=ALL

" Writing out the complete description of Scheme numerals without
" using variables is a day's work for a trained secretary...
"
" This is a useful lax approximation:
syn match	sxNumber	oneline    "[-#+0-9.][-#+/0-9a-f@i.boxesfdl]*"
syn match	sxError		oneline    ![-#+0-9.][-#+/0-9a-f@i.boxesfdl]*[^-#+/0-9a-f@i.boxesfdl \t\[\](){}";][^ \t\[\](){}";]*!

syn match	sxBoolean	oneline    "#[tf]"
syn match	sxError		oneline    !#[tf][^ \t\[\](){}";]\+!

syn match	sxChar		oneline    "#\\"
syn match	sxChar		oneline    "#\\."
syn match	sxError		oneline    !#\\.[^ \t\[\](){}";]\+!
syn match	sxChar		oneline    "#\\space"
syn match	sxError		oneline    !#\\space[^ \t\[\](){}";]\+!
syn match	sxChar		oneline    "#\\newline"
syn match	sxError		oneline    !#\\newline[^ \t\[\](){}";]\+!

" Added syntax
syn keyword sxSyntax unless when dictionary-set! define/constant define/pure define/mutable define/override define/public

" dictionarys
syn keyword sxFunc dictionary? dictionary-set! dictionary-delete! dictionary-exists?
syn keyword sxFunc dictionary-ref dictionary-ref/default dictionary-size dictionary-keys
syn keyword sxFunc dictionary-for-each dictionary-copy dictionary make-dictionary

" Added functions
syn keyword sxFunc object? zombie? xlate tail ref ref/default delete! wait xlate-append _
syn keyword sxFunc fill! set copy copy! ->list ->vector ->string ->bytevector ->char
syn keyword sxFunc ->symbol ->number ->utf16 increment! utf16->string keys exists?
syn keyword sxFunc make-random-source random-source? randomize! integer real
syn keyword sxFunc object-members object-of create-publisher get
syn keyword sxFunc unsubscribe subscribe listen publish send send/super
syn keyword sxFunc bytevector bytevector? bitwise-and bitwise-or bitwise-not
syn keyword sxFunc bitwise-xor bitwise-arithmetic-shift bitwise-bit-count

syn keyword sxFunc regexp make-regexp match

"syn match   sxFunc oneline "(send [^ \t\[\](){}]\+ \<match\>"hs=e-5

syn keyword sxFunc cadddar caadddr caddddr cddddar car-if-pair

" #%xxx identifiers
syn match sxChar oneline "#%[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"

" Object oriented additions
syn keyword sxObjSyntax object private public public/mutable public/override import import/weak this
syn keyword sxObjSyntax inspect inherit

" Debugging commands
syn keyword sxDebug debug debug-breakpoint debug-label debug-onerror debug-backtrace debug-dot
syn keyword sxDebug debug-dot-string debug-dot-env debug-ddt debug-ddt-shutdown debug-type
syn keyword sxDebug debug-object debug-where debug-memory current-cells debug-high-water-mark
syn keyword sxDebug debug-instructions debug-refcount debug-who debug-who-list debug-verify-ref
syn keyword sxDebug debug-profile debug-clear-profile debug-checkpoint debug-checkpoint-roots
syn keyword sxDebug debug-checkpoint-print debug-notail debug-compilenow debug-write-prog debug-garage

" false and true are valid booleans
syn keyword sxBoolean false true #false #true

" Simple literals:
syn region sxString start=+\%(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+ contains=@Spell

" |Strings|
syn region sxString start=+\%(\\\)\@<!|+ skip=+\\[\\|]+ end=+|+ contains=@Spell

" Quoted and backquoted stuff
syn region sxQuoted matchgroup=Delimiter start="['`]" end=![ \t)\[\]{}";]!me=e-1 contains=sxString

syn region sxQuoted matchgroup=Delimiter start="['`](" matchgroup=Delimiter end=")" contains=sxString
syn region sxQuoted matchgroup=Delimiter start="['`]#(" matchgroup=Delimiter end=")" contains=sxString

syn region sxQuoted matchgroup=Delimiter start="['`]\[" matchgroup=Delimiter end="\]" contains=sxString
syn region sxQuoted matchgroup=Delimiter start="['`]#\[" matchgroup=Delimiter end="\]" contains=sxString

syn region sxQuoted matchgroup=Delimiter start="['`]{" matchgroup=Delimiter end="}" contains=sxString
syn region sxQuoted matchgroup=Delimiter start="['`]#{" matchgroup=Delimiter end="}" contains=sxString

syn region sxUnquote matchgroup=Delimiter start="," end=![ \t\[\](){}";]!me=e-1 contains=sxString
syn region sxUnquote matchgroup=Delimiter start=",@" end=![ \t\[\](){}";]!me=e-1 contains=sxString

syn region sxUnquote matchgroup=Delimiter start=",(" end=")" contains=sxString
syn region sxUnquote matchgroup=Delimiter start=",@(" end=")" contains=sxString
syn region sxUnquote matchgroup=Delimiter start=",#(" end=")" contains=sxString
syn region sxUnquote matchgroup=Delimiter start=",@#(" end=")" contains=sxString

syn region sxUnquote matchgroup=Delimiter start=",\[" end="\]" contains=sxString
syn region sxUnquote matchgroup=Delimiter start=",@\[" end="\]" contains=sxString
syn region sxUnquote matchgroup=Delimiter start=",#\[" end="\]" contains=sxString
syn region sxUnquote matchgroup=Delimiter start=",@#\[" end="\]" contains=sxString

syn region sxUnquote matchgroup=Delimiter start=",{" end="}" contains=sxString
syn region sxUnquote matchgroup=Delimiter start=",@{" end="}" contains=sxString
syn region sxUnquote matchgroup=Delimiter start=",#{" end="}" contains=sxString
syn region sxUnquote matchgroup=Delimiter start=",@#{" end="}" contains=sxString

" Comments
syn match	sxComment	";.*$"				contains=sxHack,@Spell
syn match	sxComment	"#!.*$"
syn region	sxComment	start="#|" end="|#"	contains=sxHack,@Spell

" Synchronization and the wrapping up...
syn sync clear
"syn sync fromstart
"syn sync match matchPlace grouphere NONE "^[^ \t]"
syn sync match matchPlace grouphere NONE !^)!

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sx_syntax_inits")
  if version < 508
    let did_sx_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sxSyntax			Statement
  HiLink sxObjSyntax		Type
  HiLink sxFunc				Function

  HiLink sxString			String
  HiLink sxQuoted			Special
  HiLink sxUnquote			Special
  HiLink sxChar				Character
  HiLink sxNumber			Number
  HiLink sxBoolean			Boolean

  HiLink sxDelimiter		Delimiter
  HiLink sxConstant			Constant

  HiLink sxComment			Comment
  HiLink sxMultilineComment	Comment
  HiLink sxError			Error
  HiLink sxHack             Todo

  HiLink sxDebug			Debug

  delcommand HiLink
endif

let b:current_syntax = "sx"
