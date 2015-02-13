; note

(define balance 100)
(define (withdraw amt)
  (if (>= balance amt)
    (begin (set! balance (- balance amt))
           balance)
    "Insufficient funds"))


(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "wtf")))

(define (make-account balance)
  (define (withdraw amount)
    (if (> balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "wtf"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "wtf"))))

  dispath)


; 3.1

(define (make-accumulator amt)
  (lambda (to-add)
    (set! amt (+ to-add amt))
    amt))

; 3.2
; where should I put the cnt?

(define (make-monitor f)

    (define cnt 0)
    (define (mf input)
      (cond ((eq? 'how-many-calls?) cnt)
            ((eq? 'reset-count) (set! cnt 0))
            (else (begin (set! cnt (+ 1 cnt))
                         (f input)))))
    mf)


; 3.3
(define (make-account-2 amt secret)
  (define (withdraw amount)
    (if (> balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "wtf"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (password "balahalhahah"))

  (define (dispatch m pw)
    (cond ((eq? pw password) (cond ((eq? m 'withdraw) withdraw)
                                   ((eq? m 'deposit) deposit)
                                   (else (error "wtf"))))
          (else (error "bitch give me the password"))))
  dispath)


; 3.4
; should call-the-cops if enter wrong password 7 times


(define (make-account-2 amt secret)
  (define (withdraw amount)
    (if (> balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "wtf"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (password "balahalhahah"))

  (define (mx-attemp 7))

  (define (cur-attemp 0))

  (define (dispatch m pw)
    (cond ((eq? pw password) (cond ((eq? m 'withdraw) withdraw)
                                   ((eq? m 'deposit) deposit)
                                   (else (error "shit"))))
          (else
            (cond ((< cur-attemp mx-attemp)
                   (begin (set! cur-attemp (+ 1 cur-attemp))
                          (error "wtf")))
                  (else call-the-cops)))))
  dispath)

