(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams)) 
      the-empty-stream 
      (cons-stream (apply proc (map (lambda (arg_stream) 
                                              (stream-car arg_stream)) 
                                    argstreams)) 
                   ; cons-stream的第二项会被delay
                   ; automatically and transparently interleave the construction of the stream with its use.
                   ; 流的内部元素的构造和使用是交叉的
                   (apply stream-map (cons proc 
                                           (map (lambda (arg_stream) (stream-cdr arg_stream)) 
                                                argstreams))))))