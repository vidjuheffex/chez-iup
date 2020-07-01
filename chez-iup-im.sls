(library (iup-im)
  (export
   iup-im-open
   iup-load-image
   iup-save-image
   iup-load-animation
   ;; iup-load-animation-frames
   iup-get-native-handle-image
   iup-get-image-native-handle
   iup-image-from-im-image
   iup-image-to-im-image)

  (import (chezscheme))

  (define lib-iup-im (load-shared-object "libiupim.so"))

  (define-syntax define-function
    (syntax-rules ()
      ((_ ret name fpname args)
       (define name
         (foreign-procedure (symbol->string 'fpname) args ret)))))
  
  (define-function void iup-im-open IupImOpen())

  (define-function void* iup-load-image IupLoadImage (string))
  (define-function int iup-save-image IupSaveImage (void* string string))

  (define-function void* iup-load-animation IupLoadAnimation (string))
  ;; TODO: (define-function void* iup-load-animation-frames)

  (define-function void* iup-get-native-handle-image IupGetNativeHandleImage(void*))
  (define-function void* iup-get-image-native-handle IupGetImageNativeHandle(void*))
  (define-function void* iup-image-from-im-image IupImageFromImImage (void*))
  (define-function void* iup-image-to-im-image IupImageToImImage (void*)))

