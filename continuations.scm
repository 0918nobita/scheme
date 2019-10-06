(define (fact n)
  (if (= n 0)
    1
    (* n (fact (- n 1)))))

(define (call-with-cont-proc cont proc) (proc cont))

(print
  (call-with-cont-proc
    (lambda (a) (* a 2))
    (lambda (cont) (cont (fact 5))))) ; => 240

(print
  (* 2 (call/cc (lambda (cont) (cont (fact 5)))))) ; => 240

(define cc #f)
(define counter 0)

(define (func)
  (print "Foo")
  (call/cc (lambda (k) (set! cc k)))
  (print counter)
  (set! counter (+ counter 1)))

(define (g)
  (func)
  (print "Bar"))

(g)  ; => "Foo", 0, "Bar"
(cc) ; => 1, "Bar"
(cc) ; => 2, "Bar"

(define (f)
  (call/cc (lambda (escape)
    (begin
      (print 1)
      (print 2)
      (escape 10)
      (print 3)))))

(print (f)) ; => 1, 2, 10
