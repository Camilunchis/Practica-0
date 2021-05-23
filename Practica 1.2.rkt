; : : Práctica 1.2 : :

; Ejercicio 1. Calcule el resultado de las expresiones (sgn2 (- 2 3)) y (sgn2
; 6). Verifique sus procedimientos en el evaluador paso a paso de DrRacket .

(define (sgn2 x) (cond [(< x 0) -1]
                       [(= x 0) 0]
                       [(> x 0) 1]))

(sgn2 (- 2 3))
(sgn2 6)

; Ejercicio 2. Rehaga, utilizando expresiones cond, los ejercicios 2, 4, 6 y 7 de
; la Práctica 1, 1ra parte - sección 1.3

(define appa .)


; Ejercicio 2 de la Práctica 1

(define (fgc imagen) (cond [(=(image-height imagen)(image-width imagen)) "cuadradita"]
                           [(> (image-height imagen)(image-width imagen)) "flaquita"]
                           [(< (image-height imagen)(image-width imagen)) "gordita"]))


(fgc appa)

; Ejercicio 4 de la Práctica 1

(define (triangulo3 a b c)(cond [(> (+ a b c) 180) "Error"]
                                [(= a b c) "Equilatero"]
                                [(= a b) "Isosceles"]
                                [(= a c) "Isosceles"]
                                [(= b c) "Isosceles"]
                                [else " Escaleno"]))

(triangulo3 90 90 60)

; Ejercicio 6 de la Práctica 1

(define PC 60)
(define PL 8)

; (define (superdescuento c l)
;  (if (>= (+ c l)10)(+(* c PC 0.82)(* l PL 0.82))
;  (+(if(>= c 4)(* c PC 0.90)(* c PC))
;    (if(>= l 5)(* l PL 0.85)(* l PL)))))

(define (superdescuento c l)
  (cond [(>= (+ c l) 10) (+ (* c PC 0.82) (* l PL 0.82))]
        [(and (>= c 4) (>= l 5)) (+ (* c PC 0.90) (* l PL 0.85))]
        [(>= c 4) (+ (* c PC 0.90) (* PL l))]
        [(>= l 5) (+ (* l PL 0.85) (* PC c))]
        [(and (< c 4) (< l 5)) (+ (* PC c) (* PL l))]
        ))


; Ejercicio 7 de la Práctica 1

; (define (pitagorica? a b c)(cond [(=(+ (sqr a)(sqr b))(sqr c)) "Función Pitagórica"]
;                                  [else "No es una función Pitagórica"]))
; 
; 
; (pitagorica? 3 4 5)
; (pitagorica? 11 60 61)
; (pitagorica? 1 2 3)


; Ejercicio 3. Calcule el resultado de las expresiones (pitagorica? 3 5 6) y
; (pitagorica? 3 5 4). Atención: El resultado de la última expresión debe
; ser #true

(define (pitagorica? a b c)(cond [(=(+ (sqr a)(sqr b))(sqr c)) #t]
                                 [(=(+ (sqr b)(sqr c))(sqr a ))#t]
                                 [(=(+ (sqr a)(sqr c))(sqr b)) #t]
                                 [else #f]))

(pitagorica? 3 5 6)
(pitagorica? 3 5 4)


; Ejercicio 4. Hemos decidido hilar más fino en la clasificación de imágenes.
; Ahora diremos que una imagen es "Muy gorda" si su ancho es más que el
; doble que su alto. Del mismo modo, diremos que "Muy flaca" si su alto es
; más que el doble que su ancho. Defina una función, utilizando una
; expresión cond, que clasifique imágenes en alguna de las categorías "Muy
; Gorda", "Gorda", "Cuadrada", "Flaca", "Muy flaca".

(define (gordaflaca img)
  (cond [(= (image-width img) (image-height img)) "Cuadrada"]
        [(< (* 2 (image-width img)) (image-height img)) "Muy flaca"]
        [(< (image-width img) (image-height img)) "Flaca"]
        [(> (image-width img) (* 2 (image-height img))) "Muy gorda"]
        [(> (image-width img) (image-height img)) "Gorda"]))

(define Rectangulo(rectangle 200 80 "solid" "pink"))
(define Cuadrado(square 80 "solid" "yellow"))

(gordaflaca Cuadrado)

; Ejercicio 5. Como parte de una aplicación para observar el clima, se pide
; clasificar una temperatura de la siguiente forma

; "No Olvidar Bufanda (NOB)" (menos de 0 grados);
; "Frío (F)" (entre 0 y 15 grados);
; "Agradable (A)" (entre 15 y 25 grados);
; "Realmente Caluroso (RC)" (más de 25 grados);


(define (temperatura t)
  (cond [(< t 0) "No Olvidar Bufanda (NOB)"]
        [(and (> t 0) (< t 15)) "Frío (F)"]
        [(and (> t 15) (< t 25)) "Agradable (A)"]
        [(> t 25) "Realmente Caluroso (RC)"]))

(temperatura -3)
(temperatura 45)


; Ejercicio 6. Muchas veces se identifica a los valores booleanos con los
; números 0 (para #false) y 1 (para #true). Con esta identificación en mente,
; extienda la función signo para que pueda procesar booleanos.

(define (tf x)
  (cond [(equal? x #true) 1]
        [else 0]))

(define (sgn2 x)
  (cond [(< x 0) -1]
        [(= x 0) 0]
        [(> x 0) 1]))

; Ejercicio 7. Modifique la función definida en el ejecicio anterior para que, en
; caso de no recibir un número, booleano, imagen o string nos muestre el
; siguiente mensaje "Clase no soportada por la función.".

; Ejercicio 8. Como última extensión, modifique la función para que imprima
; "La cadena no se puede convertir a un número", en caso que se procese
; un string para el que la función number->string no devuelva un número.


(define (sgn4 x)
  (cond [(number? x) (sgn2 x)]
        [(and (string? x) (number? (string->number x))) (sgn2 (string->number x))]
        [(boolean? x) (sgn2 (tf x))]
        [(image? x) (sgn2 (- (image-width x) (image-height x)))]
        [(string? x) "La cadena no se puede convertir a un número"]
        [else "Clase no soportada por la funcion"]))
