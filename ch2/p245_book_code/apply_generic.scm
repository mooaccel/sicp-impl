(load "./ch2/apply_generic_impl.scm")

(define (real-part z) 
  (apply-generic 'real-part z)) 
(define (imag-part z) 
  (apply-generic 'imag-part z)) 
(define (magnitude z) 
  ;(display "magnitude call...")
  ; 为什么这个在2_77里能连剥两层tag?
  (apply-generic 'magnitude z)) 
(define (angle z) 
  (apply-generic 'angle z))
; 会打上tag
(define (make-from-real-imag x y) 
  ((get 'make-from-real-imag 'rectangular) x y)
) 
(define (make-from-mag-ang r a)
  ((get 'make-from-mag-ang 'polar) r a))