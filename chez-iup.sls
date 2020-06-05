;; -*- mode: scheme; coding: utf-8 -*-
;; Copyright (c) 2020 Guy Q. Schemer
;; SPDX-License-Identifier: MIT
#!r6rs

(library (iup)
  (export
   ;;Main API
   iup-open
   iup-close
   iup-is-opened?

   iup-image-lib-open

   iup-main-loop
   iup-loop-step
   iup-loop-step-wait
   iup-main-loop-level
   iup-flush
   iup-exit-loop
   iup-post-message

   iup-record-input
   iup-play-input

   iup-update
   iup-update-children
   iup-redraw
   iup-refresh
   iup-refresh-children

   iup-execute
   iup-execute-wait
   iup-help
   ;; iup-log

   iup-load
   iup-load-buffer

   iup-version
   iup-version-date
   iup-version-number
   iup-version-show

   iup-set-language
   iup-get-language
   iup-set-language-string
   iup-store-language-string
   iup-get-language-string
   iup-set-language-pack

   iup-destroy
   iup-detach
   iup-append
   iup-insert
   iup-get-child
   iup-get-child-pos
   iup-get-child-count
   iup-get-next-child
   iup-get-brother
   iup-get-parent
   iup-get-dialog
   iup-get-dialog-child
   iup-reparent

   iup-popup
   iup-show
   iup-show-xy
   iup-hide
   iup-map
   iup-unmap

   iup-reset-attribute
   ;;iup-get-all-attributes
   iup-copy-attributes
   ;;iup-set-att
   iup-set-attributes
   iup-get-attributes

   iup-set-attribute
   iup-set-str-attribute
   ;;iup-set-strf
   iup-set-int
   iup-set-float
   iup-set-double
   iup-set-rgb

   iup-get-attribute
   iup-get-int
   iup-get-int2
   iup-get-int-int
   iup-get-float
   iup-get-double
   iup-get-rgb

   iup-set-attribute-id
   iup-set-str-attribute-id
   ;;iup-set-strf-id
   iup-set-int-id
   iup-set-float-id
   iup-set-double-id
   iup-set-rgb-id

   iup-get-attribute-id
   iup-get-int-id
   iup-get-float-id
   iup-get-double-id
   iup-get-rgb-id

   iup-set-attribute-id2
   iup-set-str-attribute-id2
   ;; iup-set-strf-id2
   iup-set-int-id2
   iup-set-float-id2
   iup-set-double-id2
   iup-set-rgb-id2

   iup-get-attribute-id2
   iup-get-int-id2
   iup-get-float-id2
   iup-get-double-id2
   iup-get-rgb-id2

   iup-set-global
   iup-set-str-global
   iup-get-global

   iup-set-focus
   iup-get-focus
   iup-previous-field
   iup-next-field

   ;; iup-get-callback
   ;; iup-set-callback
   ;; iup-set-callbacks

   ;; iup-get-function
   ;; iup-set-function

   iup-get-handle
   iup-set-handle
   ;; iup-get-all-names
   ;; iup-get-all-dialogs
   iup-get-name

   iup-set-attribute-handle
   iup-get-attribute-handle
   iup-set-attribute-handle-id
   iup-get-attribute-handle-id
   iup-set-attribute-handle-id2
   iup-get-attribute-handle-id2

   iup-get-class-name
   iup-get-class-type
   ;; iup-get-all-classes
   ;; iup-get-class-attributes
   ;; iup-get-class-callbacks
   iup-save-class-attributes
   iup-copy-class-attributes
   iup-set-class-default-attribute
   iup-class-match

   iup-create
   iup-createv
   ;; iup-createp


   ;; Elements

   iup-fill 
   iup-space
   iup-radio      
   iup-vbox       
   iup-vboxv      
   iup-zbox       
   iup-zboxv      
   iup-hbox       
   iup-hboxv      

   iup-normalizer
   iup-normalizerv

   iup-cbox
   iup-cboxv
   iup-sbox
   iup-split
   iup-scroll-box
   iup-flat-scroll-box
   iup-grid-box
   iup-grid-boxv
   iup-multi-box
   iup-multi-boxv
   iup-expander
   iup-detach-box
   iup-background-box

   iup-frame
   iup-flat-frame

   iup-image
   iup-image-rgb
   iup-image-rgba

   iup-item
   iup-submenu
   iup-separator
   iup-menu
   iup-menuv

   iup-button
   iup-flat-button
   iup-flat-toggle
   iup-drop-button
   iup-flat-label
   iup-flat-separator
   iup-canvas
   iup-dialog
   iup-user
   iup-thread
   iup-label
   iup-list
   iup-flat-list
   iup-text
   iup-multi-line
   iup-toggle
   iup-timer
   iup-clipboard
   iup-progress-bar
   iup-val
   iup-flat-val
   iup-tabs
   iup-tabsv
   iup-flat-tabs
   iup-flat-tabsv
   iup-tree
   iup-link
   iup-animated-label
   iup-date-pick
   iup-calendar
   iup-colorbar
   iup-gauge
   iup-dial
   iup-color-browser

   ;; Old controls, use SPIN attribute of iup-text
   iup-spin
   iup-spinbox

   ;; utilities
   ;; String compare utility
   iup-string-compare

   ;; IupImage utilities
   iup-save-image-as-text
   iup-image-get-handle

   ;; IupText and IupScintilla utilities
   iup-text-convert-lin-col-to-pos
   iup-text-convert-pos-to-lin-col

   ;; IupText, IupList, IupTree, IupMatrix and IupScintilla utility */
   iup-convert-xy-to-pos

   ;; OLD names, kept for backward compatibility, will never be removed. */
   iup-store-global
   ;; iup-store-attribute
   ;; iup-setf-attribute
   iup-store-attribute-id
   ;; iup-setf-attribute-id
   iup-store-attribute-id2
   ;; iup-setf-attribute-id2

   ;; IupTree utilities 
   iup-tree-set-user-id
   iup-tree-get-user-id
   iup-tree-get-id
   iup-tree-set-attribute-handle

   ;; Pre-defined dialogs
   iup-file-dlg
   iup-message-dlg
   iup-color-dlg
   ;; iup-font-dlg
   iup-progress-dlg
   
   iup-get-file
   iup-message
   ;; iup-messagef
   iup-message-error
   iup-message-alarm
   iup-alarm
   ;; iup-scanf
   ;; iup-list-dialog
   
   iup-get-text
   iup-get-color
   ;; TODO: 
   ;;typedef int (*Iparamcb)(Ihandle* dialog, int param_index, void* user_data);
   ;; iup-get-param
   ;; iup-get-paramv
   iup-param
   iup-param-box
   iup-param-boxv
   
   iup-layout-dialog
   iup-element-properties-dialog
   iup-globals-dialog
   iup-class-info-dialog

   ;; common flags and return values
   IUP_ERROR
   IUP_NOERROR
   IUP_OPENED
   IUP_INVALID
   IUP_INVALID_ID

   ;; callback return values
   IUP_IGNORE
   IUP_DEFAULT
   IUP_CLOSE
   IUP_CONTINUE

   ;; IupPopop and IupShowXY Parameter Values
   IUP_CENTER
   IUP_LEFT
   IUP_RIGHT
   IUP_MOUSEPOS
   IUP_CURRENT
   IUP_CENTERPARENT
   IUP_TOP
   IUP_BOTTOM

     ;; SHOW_CB Callback Values
  IUP_SHOW 
  IUP_RESTORE 
  IUP_MINIMIZE 
  IUP_MAXIMIZE 
  IUP_HIDE 

  ;; SCROLL_CB Callback Values

  IUP_SBUP 
  IUP_SBDN 
  IUP_SBPGUP 
  IUP_SBPGDN 
  IUP_SBPOSV 
  IUP_SBDRAGV 
  IUP_SBLEFT 
  IUP_SBRIGHT 
  IUP_SBPGLEFT 
  IUP_SBPGRIGHT 
  IUP_SBPOSH 
  IUP_SBDRAGH 
  

  ;; Mouse Button Values and Macros

  IUP_BUTTON1 
  IUP_BUTTON2 
  IUP_BUTTON3 
  IUP_BUTTON4 
  IUP_BUTTON5

  ;; Predefined Masks
  IUP_MASK_FLOAT
  IUP_MASK_UFLOAT
  IUP_MASK_EFLOAT
  IUP_MASK_UEFLOAT
  IUP_MASK_FLOATCOMMA
  IUP_MASK_UFLOATCOMMA
  IUP_MASK_INT
  IUP_MASK_UINT

;; /* Old definitions for backward compatibility */
  IUPMASK_FLOAT
  IUPMASK_UFLOAT
  IUPMASK_EFLOAT
  IUPMASK_INT
  IUPMASK_UINT


  ;; Iup GetParam Callback Situations
  IUP_GETPARAM_BUTTON1
  IUP_GETPARAM_INIT   
  IUP_GETPARAM_BUTTON2
  IUP_GETPARAM_BUTTON3
  IUP_GETPARAM_CLOSE  
  IUP_GETPARAM_MAP    
  IUP_GETPARAM_OK     
  IUP_GETPARAM_CANCEL 
  IUP_GETPARAM_HELP

  ;; Use by IupColorBar
  IUP_PRIMARY
  IUP_SECONDARY

  ;; Record Input Modes
  IUP_RECBINARY
  IUP_RECTEXT
  )
  (import (chezscheme))
  
  (define lib-iup (load-shared-object "libiup.so"))
  (define lib-iup-img-lib (load-shared-object "libiupimglib.so"))
  
  (define-syntax define-function
    (syntax-rules ()
      ((_ ret name fpname args)
       (define name
         (foreign-procedure (symbol->string 'fpname) args ret)))))

  (define create-list
    (lambda (element n)
      (letrec ((helper
                (lambda (lst element n)
                  (cond ((zero? n) lst)
                        (else
                         (helper
                          (cons element lst) element (- n 1)))))))
        (helper '() element n))))

  (define-syntax
    define-ntv-function
    (lambda (x)
      (syntax-case x ()
        ((_ ret name fpname)
         (syntax (define-syntax name
                   (lambda (x)
                     (let ([new-x (append (syntax->list x) (list (syntax 0)))])
                       (syntax-case new-x ()
                         ((_ cmd (... ...))
                          (with-syntax     
                              ((system-call-spec
                                (syntax
                                 (create-list 'void*
                                              (length (syntax (cmd (... ...))))))))
                            (with-syntax
                                ((proc (syntax
                                        (eval
                                         `(foreign-procedure (symbol->string 'fpname)
                                                             (,@system-call-spec) ret)))))
                              (syntax
                               (proc cmd (... ...)))))))))))))))


  ;;Main API
  (define-function int iup-open IupOpen (int string))
  (define-function void iup-close IupClose ())
  (define-function int iup-is-opened? IupIsOpened ())

  (define-function void iup-image-lib-open IupImageLibOpen ())

  (define-function int iup-main-loop IupMainLoop ())
  (define-function int iup-loop-step IupLoopStep ())
  (define-function int iup-loop-step-wait IupLoopStepWait ())
  (define-function int iup-main-loop-level IupMainLoopLevel ())
  (define-function void iup-flush IupFlush ())
  (define-function void iup-exit-loop IupExitLoop ())
  (define-function void iup-post-message IupPostMessage (void* string int double void*))

  
  (define-function int iup-record-input IupRecordInput (string int))
  (define-function int iup-play-input IupPlayInput (string))

  (define-function void iup-update IupUpdate (void*))
  (define-function void iup-update-children IupUpdateChildren (void*))
  (define-function void iup-redraw IupRedraw (void* int))
  (define-function void iup-refresh IupRefresh (void*))
  (define-function void iup-refresh-children IupRefreshChildren (void*))

  (define-function int iup-execute IupExecute (string string))
  (define-function int iup-execute-wait IupExecuteWait (string string))
  (define-function int iup-help IupHelp (string))
  ;; TODO
  ;;(define-function void iup-log IupLog(const char* type, const char* format, ...)

  (define-function string iup-load IupLoad (string))
  (define-function string iup-load-buffer IupLoadBuffer (string))

  (define-function string iup-version IupVersion ())
  (define-function string iup-version-date IupVersionDate ())
  (define-function int iup-version-number IupVersionNumber ())
  (define-function void iup-version-show IupVersionShow ())
  
  (define-function void iup-set-language IupSetLanguage (string))                             
  (define-function string iup-get-language IupGetLanguage ())
  (define-function void iup-set-language-string IupSetLanguageString (string string))
  (define-function void iup-store-language-string IupStoreLanguageString (string string))
  (define-function string iup-get-language-string IupGetLanguageString (string))
  (define-function void iup-set-language-pack IupSetLanguagePack (void*))

  (define-function void iup-destroy IupDestroy (void*))
  (define-function void iup-detach IupDetach (void*))
  (define-function void* iup-append IupAppend (void* void*))
  (define-function void* iup-insert IupInsert (void* void* void*))
  (define-function void* iup-get-child IupGetChild (void*  int))
  (define-function int iup-get-child-pos IupGetChildPos (void* void*))
  (define-function int iup-get-child-count IupGetChildCount(void*))
  (define-function void* iup-get-next-child IupGetNextChild (void* void*))
  (define-function void* iup-get-brother IupGetBrother  (void*))
  (define-function void* iup-get-parent IupGetParent (void*))
  (define-function void* iup-get-dialog IupGetDialog (void*))
  (define-function void* iup-get-dialog-child IupGetDialogChild(void* string))
  (define-function void* iup-reparent IupReparent (void* void*))

  (define-function int iup-popup IupPopup (void* int int))
  (define-function int iup-show IupShow (void*))
  (define-function int iup-show-xy IupShowXY (void* int int))
  (define-function int iup-hide IupHide (void*))
  (define-function int iup-map IupMap (void*))
  (define-function void iup-unmap IupUnmap (void*))

  (define-function void iup-reset-attribute IupResetAttribute (void* string))
  ;; TODO
  ;;(define-function int iup-get-all-attributes IupGetAllAttributes (void* char**  int))
  (define-function void iup-copy-attributes IupCopyAttributes(void* void*))
  ;; TODO
  ;;(define-function void* iup-set-att IupSetAtt (string void* string  ...))
  (define-function void* iup-set-attributes IupSetAttributes (void* string))
  (define-function string iup-get-attributes IupGetAttributes (void*))

  (define-function void iup-set-attribute IupSetAttribute (void* string string))
  (define-function void iup-set-str-attribute IupSetStrAttribute(void* string string))
  ;; TODO
  ;; (define-function void iup-set-strf IupSetStrf (void* string string ...))
  (define-function void iup-set-int IupSetInt (void* string int))
  (define-function void iup-set-float IupSetFloat (void* string float))
  (define-function void iup-set-double IupSetDouble (void* string double))
  (define-function void iup-set-rgb IupSetRGB (void* string char char char))

  (define-function string iup-get-attribute IupGetAttribute (void* string))
  (define-function int iup-get-int IupGetInt (void* string))
  (define-function int iup-get-int2 IupGetInt2 (void* string))
  (define-function int iup-get-int-int IupGetIntInt (void* string int int))
  (define-function float iup-get-float IupGetFloat (void* string))
  (define-function double iup-get-double IupGetDouble (void* string))
  (define-function void iup-get-rgb IupGetRGB (void* string char char char))

  (define-function void iup-set-attribute-id IupSetAttributeId (void* string int string))
  (define-function void iup-set-str-attribute-id IupSetStrAttributeId (void* string int string))
  ;;TODO
  ;; (define-function void iup-set-strf-id IupSetStrfId (Ihandle* ih, const char* name, int id, const char* format, ...))
  (define-function void iup-set-int-id IupSetIntId (void* string int int))
  (define-function void iup-set-float-id IupSetFloatId (void* string int float))
  (define-function void iup-set-double-id IupSetDoubleId (void* string int double))
  (define-function void iup-set-rgb-id IupSetRGBId (void* string int char char char))

  (define-function string iup-get-attribute-id IupGetAttributeId (void* string int))
  (define-function int iup-get-int-id IupGetIntId (void* string int))
  (define-function float iup-get-float-id IupGetFloatId (void* string int))
  (define-function double iup-get-double-id IupGetDoubleId (void* string int))
  (define-function void iup-get-rgb-id IupGetRGBId (void* string int  char char char))
  
  (define-function void iup-set-attribute-id2 IupSetAttributeId2 (void* string int int string))
  (define-function void iup-set-str-attribute-id2 IupSetStrAttributeId2 (void* string int int string))
  ;; TODO
  ;; IUP_API void  IupSetStrfId2(Ihandle* ih, const char* name, int lin, int col, const char* format, ...))
  (define-function void iup-set-int-id2 IupSetIntId2 (void* string int int int))
  (define-function void iup-set-float-id2 IupSetFloatId2(void* string int int float))
  (define-function void iup-set-double-id2 IupSetDoubleId2(void* string int int double))
  (define-function void iup-set-rgb-id2 IupSetRGBId2(void* string int int char char char))

  (define-function string iup-get-attribute-id2 IupGetAttributeId2 (void* string int int))
  (define-function int iup-get-int-id2 IupGetIntId2 (void* string int int))
  (define-function float iup-get-float-id2 IupGetFloatId2 (void* string int int))
  (define-function double iup-get-double-id2 IupGetDoubleId2 (void* string int int))
  (define-function void iup-get-rgb-id2 IupGetRGBId2 (void* string int int char char char))

  (define-function void iup-set-global IupSetGlobal  (string string))
  (define-function void iup-set-str-global IupSetStrGlobal(string string))
  (define-function string iup-get-global IupGetGlobal  (string))

  (define-function void* iup-set-focus IupSetFocus (void*))
  (define-function void* iup-get-focus IupGetFocus ())
  (define-function void* iup-previous-field IupPreviousField (void*))
  (define-function void* iup-next-field IupNextField (void*))

  ;; TODO
  ;;(define-function Icallback IupGetCallback (Ihandle* ih, const char *name))
  ;;(define-function Icallback IupSetCallback (Ihandle* ih, const char *name, Icallback func))
  ;; IUP_API Ihandle*  IupSetCallbacks(Ihandle* ih, const char *name, Icallback func, ...))

  ;; TODO
  ;; IUP_API Icallback IupGetFunction(const char *name))
  ;; IUP_API Icallback IupSetFunction(const char *name, Icallback func))
  (define-function void* iup-get-handle IupGetHandle (string))
  (define-function void* iup-set-handle IupSetHandle (string void*))
  ;; TODO
  ;;(define-function int       IupGetAllNames  (char** names, int n))
  ;;(define-function int       IupGetAllDialogs(char** names, int n))
  (define-function string iup-get-name IupGetName (void*))

  (define-function void iup-set-attribute-handle IupSetAttributeHandle(void* string void*))
  (define-function void* iup-get-attribute-handle IupGetAttributeHandle(void* string))
  (define-function void iup-set-attribute-handle-id IupSetAttributeHandleId(void* string int void*))
  (define-function void* iup-get-attribute-handle-id IupGetAttributeHandleId(void* string int))
  (define-function void iup-set-attribute-handle-id2 IupSetAttributeHandleId2(void* string int int void*))
  (define-function void* iup-get-attribute-handle-id2 IupGetAttributeHandleId2(void* string int int))

  (define-function string iup-get-class-name IupGetClassName(void*))
  (define-function string iup-get-class-type IupGetClassType(void*))
  ;; TODO
  ;; (define-function int iup-get-all-classes IupGetAllClasses)(char** names, int n)
  ;; (define-function int iup-get-class-attributes IupGetClassAttributes(const char* classname, char** names, int n))
  ;; (define-function int iup-get-class-callbacks IupGetClassCallbacks(const char* classname, char** names, int n))
  (define-function void iup-save-class-attributes IupSaveClassAttributes(void*))
  (define-function void iup-copy-class-attributes IupCopyClassAttributes(void* void*))
  (define-function void iup-set-class-default-attribute IupSetClassDefaultAttribute(string string string))
  (define-function int iup-class-match IupClassMatch(void* string))

  (define-function void* iup-create IupCreate (string))
  (define-function void*  iup-createv IupCreatev(string void*))
  ;; TODO
  ;; IUP_API Ihandle*  IupCreatep(const char *classname, void* first, ...))

  ;; Elements
  
  (define-function void* iup-fill IupFill ())
  (define-function void* iup-space IupSpace ())

  (define-function void* iup-radio IupRadio (void*))
  (define-ntv-function void* iup-vbox IupVbox)
  (define-function void* iup-vboxv IupVboxv (void*))
  (define-ntv-function void* iup-zbox IupZbox)
  (define-function void* iup-zboxv IupZboxv (void*))
  (define-ntv-function void* iup-hbox IupHbox)
  (define-function void* iup-hboxv IupHboxv (void*))

  (define-ntv-function void* iup-normalizer IupNormalizer)
  (define-function void* iup-normalizerv IupNormalizerv (void*))

  (define-ntv-function void* iup-cbox IupCbox)
  (define-function void* iup-cboxv  IupCboxv (void*))
  (define-function void* iup-sbox  IupSbox (void*))
  (define-function void*  iup-split IupSplit (void* void*))
  (define-function void*  iup-scroll-box IupScrollBox  (void*))
  (define-function void*  iup-flat-scroll-box IupFlatScrollBox (void*))
  (define-ntv-function void*  iup-grid-box IupGridBox)
  (define-function void*  iup-grid-boxv IupGridBoxv   (void*))
  (define-ntv-function void* iup-multi-box IupMultiBox)
  (define-function  void* iup-multi-boxv IupMultiBoxv (void*))
  (define-function void* iup-expander IupExpander (void*))
  (define-function void* iup-detach-box IupDetachBox (void*))
  (define-function void* iup-background-box IupBackgroundBox (void*))

  (define-function void* iup-frame  IupFrame (void*))
  (define-function void* iup-flat-frame IupFlatFrame (void*))
  
  (define-function void* iup-image IupImage (int int string))
  (define-function void* iup-image-rgb IupImageRGB (int int string))
  (define-function void* iup-image-rgba IupImageRGBA (int int string))

  (define-function void* iup-item IupItem (string string))
  (define-function void* iup-submenu IupSubmenu (string void*))
  (define-function void* iup-separator IupSeparator ())
  (define-ntv-function void* iup-menu IupMenu)
  (define-function void* iup-menuv IupMenuv (void*))
  

  (define-function void* iup-button IupButton (string string))
  (define-function void* iup-flat-button IupFlatButton (string))
  (define-function void* iup-flat-toggle IupFlatToggle (string))
  (define-function void* iup-drop-button IupDropButton (void*))
  (define-function void* iup-flat-label IupFlatLabel (string))
  (define-function void* iup-flat-separator IupFlatSeparator ())
  (define-function void* iup-canvas IupCanvas (string))
  (define-function void* iup-dialog IupDialog (void*))
  (define-function void* iup-user IupUser ())
  (define-function void* iup-thread IupThread ())
  (define-function void* iup-label IupLabel (string))
  (define-function void* iup-list IupList (string))
  (define-function void* iup-flat-list IupFlatList ())
  (define-function void* iup-text IupText (string))
  (define-function void* iup-multi-line IupMultiLine (string))
  (define-function void* iup-toggle IupToggle (string string))
  (define-function void* iup-timer IupTimer ())
  (define-function void* iup-clipboard IupClipboard ())
  (define-function void* iup-progress-bar IupProgressBar())
  (define-function void* iup-val IupVal (string))
  (define-function void* iup-flat-val IupFlatVal (string))
  (define-ntv-function void* iup-tabs IupTabs)
  (define-function void* iup-tabsv IupTabsv (void*))
  (define-ntv-function void* iup-flat-tabs IupFlatTabs)
  (define-function void* iup-flat-tabsv IupFlatTabsv (void*))
  (define-function void* iup-tree IupTree ())
  (define-function void* iup-link IupLink (string string))
  (define-function void* iup-animated-label IupAnimatedLabel (void*))
  (define-function void* iup-date-pick IupDatePick ())
  (define-function void* iup-calendar IupCalendar ())
  (define-function void* iup-colorbar IupColorbar ())
  (define-function void* iup-gauge IupGauge ())
  (define-function void* iup-dial IupDial (string))
  (define-function void* iup-color-browser IupColorBrowser())

  ;; Old controls, use SPIN attribute of IupText */
  (define-function void* iup-spin IupSpin ())
  (define-function void* iup-spinbox IupSpinbox (void*))

  ;; Utilities

  ;; String compare utility
  (define-function int iup-string-compare IupStringCompare (string string int int))

   ;; IupImage utilities
  (define-function int iup-save-image-as-text IupSaveImageAsText (void* string string string))
  (define-function void* iup-image-get-handle IupImageGetHandle (string))

   ;; IupText and IupScintilla utilities
  (define-function void iup-text-convert-lin-col-to-pos IupTextConvertLinColToPos (void* int int int))
  (define-function void iup-text-convert-pos-to-lin-col IupTextConvertPosToLinCol (void* int int int))

  ;; IupText, IupList, IupTree, IupMatrix and IupScintilla utility */
  (define-function int iup-convert-xy-to-pos IupConvertXYToPos (void* int int))

  ;; OLD names, kept for backward compatibility, will never be removed. */
  (define-function void iup-store-global IupStoreGlobal(string string))
  (define-function void iup-store-attribure IupStoreAttribute(void* string string))
  ;; TODO
  ;;(define-function void IupSetfAttribute(Ihandle* ih, const char* name, const char* format, ...))
  (define-function void iup-store-attribute-id IupStoreAttributeId(void* string  int string))
  ;; TODO
  ;; IUP_API void IupSetfAttributeId(Ihandle* ih, const char* name, int id, const char* f, ...);
  (define-function void iup-store-attribute-id2 IupStoreAttributeId2(void* string int int string))
  ;; TODO
  ;; IUP_API void IupSetfAttributeId2(Ihandle* ih, const char* name, int lin, int col, const char* format, ...);

   ;; IupTree utilities 
  (define-function int iup-tree-set-user-id IupTreeSetUserId(void* int void*))
  (define-function void* iup-tree-get-user-id IupTreeGetUserId(void* int))
  (define-function int iup-tree-get-id IupTreeGetId(void* void*))
  (define-function void iup-tree-set-attribute-handle IupTreeSetAttributeHandle(void* string int void*)) ;  deprecated, use IupSetAttributeHandleId
  
  ;; Pre-defined dialogs
    
  (define-function void* iup-file-dlg IupFileDlg ())
  (define-function void* iup-message-dlg IupMessageDlg ())
  (define-function void* iup-color-dlg IupColorDlg ())
  (define-function void* iup-font-flg IupFontDlg ())
  (define-function void* iup-progress-dlg IupProgressDlg ())
  
  (define-function int  iup-get-file IupGetFile(string))
  (define-function void iup-message IupMessage(string string))
  ;;TODO
  ;;IUP_API void IupMessagef(const char *title, const char *format, ...);
  (define-function  void iup-message-error IupMessageError (void* string))
  (define-function  int iup-message-alarm IupMessageAlarm (void* string string))
  (define-function  int iup-alarm IupAlarm (string string string string string))
  ;; TODO
  ;;(define-function  int iup-scanf IupScanf(const char *format, ...);
  ;;(define-function  int iup-listdialog   IupListDialog(int type, const char *title, int size, const char** list,
  ;;                  int op, int max_col, int max_lin, int* marks);
  (define-function int iup-get-text IupGetText (string string int))
  (define-function int  iup-get-color IupGetColor (int int char char char))
  
  ;; TODO
  ;;typedef int (*Iparamcb)(Ihandle* dialog, int param_index, void* user_data);
  ;;(define-function  int IupGetParam(const char* title, Iparamcb action, void* user_data, const char* format,...);
  ;;(define-function  int IupGetParamv(const char* title, Iparamcb action, void* user_data, const char* format, int param_count, int param_extra, void** param_data);
  (define-function  void* iup-param  IupParam(string))
  (define-ntv-function  void* iup-param-box IupParamBox)
  (define-function void*  iup-param-boxv IupParamBoxv(void*))
  
  (define-function void* iup-layout-dialog  IupLayoutDialog(void*))
  (define-function void* iup-element-properties-dialog IupElementPropertiesDialog(void* void*))
  (define-function void* iup-globals-dialog IupGlobalsDialog())
  (define-function void* iup-class-info-dialog IupClassInfoDialog(void*))

  ;; common flags and return values

  (define IUP_ERROR 1)
  (define IUP_NOERROR 0)
  (define IUP_OPENED -1)
  (define IUP_INVALID -1)
  (define IUP_INVALID_ID -10)
  
  ;; callback return values

  (define IUP_IGNORE -1)
  (define IUP_DEFAULT -2)
  (define IUP_CLOSE -3)
  (define IUP_CONTINUE -4)
  
  
  ;; IupPopup and IupShowXY Parameter Values
  (define IUP_CENTER #xFFFF)
  (define IUP_LEFT #xFFFE)
  (define IUP_RIGHT #xFFFD)
  (define IUP_MOUSEPOS #xFFFC)
  (define IUP_CURRENT #xFFFB)
  (define IUP_CENTERPARENT #xFFFA)
  (define IUP_TOP IUP_LEFT)
  (define IUP_BOTTOM IUP_RIGHT)

  ;; SHOW_CB Callback Values
  (define IUP_SHOW 0)
  (define IUP_RESTORE 1)
  (define IUP_MINIMIZE 2)
  (define IUP_MAXIMIZE 3)
  (define IUP_HIDE 4)

  ;; SCROLL_CB Callback Values

  (define IUP_SBUP 0)
  (define IUP_SBDN 1)
  (define IUP_SBPGUP 2)
  (define IUP_SBPGDN 3)
  (define IUP_SBPOSV 4)
  (define IUP_SBDRAGV 5)
  (define IUP_SBLEFT 6)
  (define IUP_SBRIGHT 7)
  (define IUP_SBPGLEFT 8)
  (define IUP_SBPGRIGHT 9)
  (define IUP_SBPOSH 10)
  (define IUP_SBDRAGH 11)
  

  ;; Mouse Button Values and Macros

  (define IUP_BUTTON1 "1")
  (define IUP_BUTTON2 "2")
  (define IUP_BUTTON3 "3")
  (define IUP_BUTTON4 "4")
  (define IUP_BUTTON5 "5")

  ;; TODO
;;   #define iup_isshift(_s)    (_s[0]=='S')
;; #define iup_iscontrol(_s)  (_s[1]=='C')
;; #define iup_isbutton1(_s)  (_s[2]=='1')
;; #define iup_isbutton2(_s)  (_s[3]=='2')
;; #define iup_isbutton3(_s)  (_s[4]=='3')
;; #define iup_isdouble(_s)   (_s[5]=='D')
;; #define iup_isalt(_s)      (_s[6]=='A')
;; #define iup_issys(_s)      (_s[7]=='Y')
;; #define iup_isbutton4(_s)  (_s[8]=='4')
;; #define iup_isbutton5(_s)  (_s[9]=='5')

;; Predefined Masks
  (define IUP_MASK_FLOAT "[+/-]?(/d+/.?/d*|/./d+)")
  (define IUP_MASK_UFLOAT "(/d+/.?/d*|/./d+)")
  (define IUP_MASK_EFLOAT "[+/-]?(/d+/.?/d*|/./d+)([eE][+/-]?/d+)?")
  (define IUP_MASK_UEFLOAT "(/d+/.?/d*|/./d+)([eE][+/-]?/d+)?")
  (define IUP_MASK_FLOATCOMMA "[+/-]?(/d+/,?/d*|/,/d+)")
  (define IUP_MASK_UFLOATCOMMA "(/d+/,?/d*|/,/d+)")
  (define IUP_MASK_INT "[+/-]?/d+")
  (define IUP_MASK_UINT "/d+")

;; /* Old definitions for backward compatibility */
  (define IUPMASK_FLOAT IUP_MASK_FLOAT)
  (define IUPMASK_UFLOAT IUP_MASK_UFLOAT)
  (define IUPMASK_EFLOAT IUP_MASK_EFLOAT)
  (define IUPMASK_INT IUP_MASK_INT)
  (define IUPMASK_UINT IUP_MASK_UINT)


  ;; Iup GetParam Callback Situations
  (define IUP_GETPARAM_BUTTON1 -1)
  (define IUP_GETPARAM_INIT    -2)
  (define IUP_GETPARAM_BUTTON2 -3)
  (define IUP_GETPARAM_BUTTON3 -4)
  (define IUP_GETPARAM_CLOSE   -5)
  (define IUP_GETPARAM_MAP     -6)
  (define IUP_GETPARAM_OK     IUP_GETPARAM_BUTTON1)
  (define IUP_GETPARAM_CANCEL IUP_GETPARAM_BUTTON2)
  (define IUP_GETPARAM_HELP   IUP_GETPARAM_BUTTON3)

  ;; Use by IupColorBar
  (define IUP_PRIMARY -1)
  (define IUP_SECONDARY -2)

  ;; Record Input Modes
  (define IUP_RECBINARY 0)
  (define IUP_RECTEXT 1)  
  )
