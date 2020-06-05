(library (iup-scintilla)
  (export
   iup-scintilla-open
   iup-scintilla
   iup-scintilla-dialog)
  
  (import (chezscheme))

  (define lib-iup-scintilla (load-shared-object "libiup_scintilla.so"))

  (define-syntax define-function
    (syntax-rules ()
      ((_ ret name fpname args)
       (define name
         (foreign-procedure (symbol->string 'fpname) args ret)))))

  (define-function void* iup-scintilla IupScintilla ())
  (define-function void* iup-scintilla-dialog IupScintillaDlg ())
  (define-function void iup-scintilla-open IupScintillaOpen ()))
