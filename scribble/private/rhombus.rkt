#lang rhombus
import:
  rhombus/macro: no_prefix
  "typeset-rhombus.rkt": no_prefix

export:
  rhombus
  rhombusblock

expr.rule '(rhombus ($form ...)):
  '(#{typeset-rhombus}('($form ...)))

expr.macro '(rhombusblock $tail ...):
  ~op_stx: me
  match '($tail ...)
  | '(: $content ...; ...):
      values('(#{typeset-rhombusblock}('($tail ...))), '())
  | ~else: raise_syntax_error("expected a block", '($me $tail ...))

