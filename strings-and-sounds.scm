; Project: "Strings and sounds" 
; Do a composition of the song "Mary had a little lamb"
; Author: Anh Thuc (Christina) Vu
; Date: 2022-09-12
; ACKNOWLEDGEMENTS:
"Part 1"
; slight-trim = string? 
; (equal? (substring str 0 1) " ") 
; (substring str 1 (string-length str)
  ;;; Returns str and removes a single leading space and a single trailing space on the ends of str, if they exist.
  (define slight-trim ;; THE LAST CASE HAS BEEN TRIMMED DOWN IN THE LAST CHARACTER
    (lambda(str)
      (cond 
        [(and (equal? (substring str 0 1) " ")
            (equal? (substring str (- (string-length str) 1) (string-length str))" "))
          (substring str 1 (- (string-length str) 1))]
        [(equal? (substring str 0 1) " ") 
          (substring str 1 (string-length str))]
        [(equal? 
        (substring str (- (string-length str) 1) (string-length str)) " ")
        (substring str 0 (- (string-length str) 1))]
        [else str]))) 
  (slight-trim " apple ") 
  (slight-trim " apple")
  (slight-trim "apple ")
  
  ;;; (string-ref str1 0) (string-ref str2 0) equal?
  ;;; str1,str2 = string?
  ;;; Returns whether str1 starts with str2
  
  (define starts-with? ; ONE TEST-CASE HAS BEEN EVALUATED TO #t
    (lambda (str1 str2)
      (char-ci=? (string-ref str1 (- (string-length str1) 1))
        (string-ref str2 0))))
  (starts-with? "hello" "ola")
  (starts-with? "hi" "chao") 

  ;;; (substring str1 (- (string-length str1)( string-length str2))(string-length str1)) str2) equal? 
;;; str1,str2 = string? 
;;; Returns whether str1 ends with str2

(define ends-with? 
  (lambda (str1 str2)
    (equal? (substring str1 (- (string-length str1)( string-length str2))
    (string-length str1)) 
    str2)))
(ends-with? "hello" "ola")
(ends-with? "hi" "chao")
"Part 2"
(import music)
(define naive-mary-had-a-little-lamb 
  (seq
    (note 69, qn)
    (note 67, qn)
    (note 65, qn)
    (note 67, qn)
    (note 69, qn)
    (note 69, qn)
    (note 69, hn)
    (note 67, qn)
    (note 67, qn) 
    (note 67, hn)
    (note 69, qn)
    (note 69,qn)
    (note 69, hn)
    (note 69, qn)
    (note 67, qn)
    (note 65, qn)
    (note 67, qn)
    (note 69, qn)
    (note 69, qn)
    (note 69, hn)
    (note 67, qn)
    (note 67, qn)
    (note 69, qn)
    (note 67, qn)
    (note 65, hn)
    (note 65, hn )))
naive-mary-had-a-little-lamb 

"Part 3"
;;; power-chord -> real
;;; x : note
;;; y : dur
;;; Returns the note and perfect fifth away from the note
(define power-chord
  (lambda (x y)
    (par (note x y) ; I HAVE ADDED PAR HERE SO THE NOTES ARE PLAYED AT THE SAME TIME.
      (note (+ x 7) y)))) 

(power-chord 60 qn) 
(power-chord 62 qn)
(power-chord 64 qn) 

;;; minor-7th -> real
;;; x : note
;;; y : dur
;;; Returns the note, perfect third, perfect fifth away from the note

(define minor-7th
  (lambda (x y)
    (seq (note x y)
      (note (+ x 3) y)
      (note (+ x 7) y)
      (note (+ x 10) y)))) 

(minor-7th 60 hn) 
(minor-7th 58 hn) 
(minor-7th 59 hn) 

;;; pitch -> real
;;; note -> number? 
;;; Returns the number code of the chord 
(define pitch
  (lambda (note)
    (cond 
      [(equal? note "C") 60]
      [(equal? note "C#") 61]
      [(equal? note "Db") 62]
      [(equal? note "D") 64] 
      [(equal? note "D#") 63]
      [(equal? note "Eb") 63]
      [(equal? note "E") 64]
      [(equal? note "F") 65]
      [(equal? note "F#") 66 ]
      [(equal? note "Gb") 66 ]
      [(equal? note "G") 67 ]
      [(equal? note "G#") 68 ]
      [(equal? note "Ab") 68 ]
      [(equal? note "A") 69]
      [(equal? note "A#") 70]
      [(equal? note "Bb") 70]
      [(equal? note "B") 71 ]
      [else (error "Invalid note given [pitch]")]
      )))
(pitch "A") 
(pitch "B")
(pitch "Bb") 

;;; marry-had-a-little-lamp -> real
;;; (seq(note number dur) (power-chord(pitch"chord ")dur)) (minor-7th(pitch"chord") dur))
;;; Returns the chords playing the song "Marry had a little lamp"

(define marry-had-a-little-lamp
(seq 
  (note 69, qn)
  (note 67, qn)
  (note 65, qn)
  (note 67, qn)  
  (note 69, qn)
  (power-chord (pitch "A") qn)
  (note 69, qn)
  (note 69, hn) 
  (repeat 3(note 67, qn))
  (repeat 4 (note 69, qn))
  (power-chord (pitch "B") qn)
  (note 67, qn)
  (note 65, qn)
  (note 67, qn)
  (repeat 3 (note 69, qn))
  (minor-7th (pitch "B") hn)
  (repeat 2 (note 67, qn))
  (note 69, qn) 
  (note 67, qn)
  (repeat 2 (note 65, hn))))
marry-had-a-little-lamp 











