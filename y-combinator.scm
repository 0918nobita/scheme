(define fact
  (lambda (n)
    (if (zero? n)
        1
        (* n (fact (- n 1))))))

(fact 5) ; => 120

(define F
  (lambda (f)
    (lambda (n)
      (if (zero? n)
          1
          (* n (f (- n 1)))))))

((F fact) 5) ; => 120

(define F2
  (lambda (f)
    (lambda (n)
      (if (zero? n)
          1
          (* n ((f f) (- n 1)))))))

((F2 F2) 5) ; => 120

((F2
  (lambda (f)
    (lambda (n)
      (if (zero? n)
          1
          (* n ((f f) (- n 1))))))) 5) ; => 120

(((lambda (f)
    (lambda (n)
      (if (zero? n)
          1
          (* n ((f f) (- n 1))))))
  (lambda (f)
    (lambda (n)
      (if (zero? n)
          1
          (* n ((f f) (- n 1))))))) 5) ; => 120

; fixed point combinator
(define Y
  (lambda (f)
    ((lambda (p)
       (f (lambda (n) ((p p) n))))
     (lambda (p)
       (f (lambda (n) ((p p) n)))))))

((Y F) 5) ; => 120
((Y
  (lambda (f)
    (lambda (n)
      (if (zero? n)
          1
          (* n (f (- n 1)))))))
 5) ; => 120
