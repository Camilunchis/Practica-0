;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practica 0|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; |Práctica 0|

; Expresiones aritméticas
; 1 - Considere las siguientes expresiones aritméticas

; 12 * 5 - 7 * 6
; 3 * 5 - 7 * 4 / 14 + 3 / 1
; cos(0.8) + 1/5 + sen(0.5) * 3.5

; a. Exprese cada una de ellas con la sintaxis de racket .

; (-(* 12 5)(* 7 6))
; (+(-(* 3 5)(* 7 (/ 4 14)))(/ 3 1))
; (+(+(cos 0.8)(/ 1 5)) (*(sin 0.5) 3.5))

; 2 - Usando DrRacket, evalúe las siguientes expresiones.

; a.(/ 1 (sin (sqrt 3))) -> Bien
; b.(* (sqrt 2) (sin pi)) -> Bien
; c.(+ 3 (sqrt (- 4))) -> Bien
; d.(* (sqrt 5) (sqrt (/ 3 (cos pi)))) -> Bien
; e.(/ (sqrt 5) (sin (* 3 0)))-> No se puede porque está dividiendo por 0 #[/: division by zero]#
; f.(/ (+ 3) (* 2 4)) -> No se puede porque el operador de la suma necesita minimo dos argumentos para funcionar #[+: expects at least 2 arguments, but found only 1 (+3)]#
; g.(* 1 2 3 4 5 6 7 8) -> Bien
; h.(/ 120 2 3 2 2 5) -> Bien


; Strings
; 1 - Evalúe en DrRacket las siguientes expresiones

; a.(string-append "Hola" "mundo") -> Está "bien". Importante agregarle un espacio delante del "Hola" o detrás de "mundo" para que el programa no lo lea como "Holamundo"
; b.(string-append "Pro" "gra" "ma") -> Bien.
; c.(number->string 1357) -> Bien.
; d.(string-append "La respuesta es "(+ 21 21)) -> No funciona porque string-append solo concatena strings y no números. #[string-append: expects a string, given 42]#
; e.(string-append "La respuesta es " (number->string (+ 21 21))) -> Bien.
; f.(*(string-length "Hola")(string-length "Chau")) -> Bien.


; Mezclando booleanos y números
; 1 - Evalúe en DrRacket las siguientes expresiones

; a.(not #t)-> Bien (#false)
; b.(or #t #f) -> Bien (#true)
; c.(and #t #f) -> Bien (#false)
; d.(and #t (or #f (not #f)) (not #t)) -> Bien (#false)
; e.(not (= 2 (* 1 3))) -> Bien (#true)
; f.(or (= 2 (* 1 3)) (< 4 (+ 3 2))) -> Bien (#true)

; 2 - Considere las siguientes frases

; a. El coseno de 0 es positivo
; (< 0 (cos 0))

; b. La longitud de la cadena "Hola, mundo" es 14
; (= 14(string-length "Hola, mundo")) -> La longitud es 11

; c. pi es un número entre 3 y 4
; (and (<= 3 pi) (<= pi 4))

; d. El área de un cuadrado de lado 5 es igual a la raíz cudarada de 625
; (= (sqrt 625)(sqr 5))



