(define add4 (let ((x 4)) (lambda (y) (+ x y))))

(display ((lambda (x y . z) z) 3 4 5 6)) ; => (5 6)

(display (add4 6)) ; => 10

(display (if (> 3 2) 'yes 'no)) ; => yes
