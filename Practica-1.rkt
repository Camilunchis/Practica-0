; :Práctica 1: ;

; :Proposiciones y Condicionales:  :Leyes de Reducción:

; - Ejercicios -


; 1. Diremos que una imagen es flaca si su alto es mayor o igual a su ancho.
; Caso contrario diremos que es gorda. Defina una función que tome como
; argumento una imagen, y la clasifique en "Flaca" o "Gorda"


(define appa .)

(define (gorda? h a)(>=(image-width a)(image-height h)))
  
(define (flaca_gorda imagen) (if (>= (image-height imagen) (image-width imagen)) "Flaca" "Gorda"))
 
(flaca_gorda appa)

; 2. Modifique el ejercicio anterior para que ahora clasifique las imágenes en
; "Flaca", "Gorda" o "Cuadrada" (si su alto es igual a su ancho).

(define (flaca-gorda-cuadrada imagen) (if (=(image-height imagen)(image-width imagen)) "Cuadrada" (if (> (image-height imagen) (image-width imagen)) "Flaca" "Gorda")))
(define (flaca-gorda-cuadrada2 imagen) (if (=(image-height imagen)(image-width imagen)) "Cuadrada" (flaca_gorda imagen)))

(define (fgc imagen) (cond [(=(image-height imagen)(image-width imagen)) "cuadradita"]
                           [(> (image-height imagen)(image-width imagen)) "flaquita"]
                           [(< (image-height imagen)(image-width imagen)) "gordita"]))

(fgc appa)
(flaca-gorda-cuadrada2 appa)


; 3. Defina una función que dado tres números que representan la amplitud
; de los tres ángulos interiores de un triánguno, devuelva un string que nos
; indique si es equilátero, isósceles o escaleno.

(define (triangulo a b c) (if (= a b c) "Equilatero" (if (or (= a b) (= b c) (= a c)) "Isoceles" "Escaleno")))

(define (triangulo2 a b c)(cond [(= a b c) "Equilatero"]
                                [(= a b) "Isosceles"]
                                [(= a c) "Isosceles"]
                                [(= b c) "Isosceles"]
                                [else " Escaleno"]))

(triangulo 60 60 60)
(triangulo2 70 60 60)

; 4. Modifique el ejercicio anterior para que nos aparezca un string con la
; palabra error en caso que los valores recibidos como argumento no
; correspondan a los ángulos de un triángulo. Ayuda: La suma de los
; ángulos interiores de un triángulo es 180°.

(define (triangulo3 a b c)(cond [(> (+ a b c) 180) "Error"]
                                [(= a b c) "Equilatero"]
                                [(= a b) "Isosceles"]
                                [(= a c) "Isosceles"]
                                [(= b c) "Isosceles"]
                                [else " Escaleno"]))


; (define (triangulo4 a b c)
; (if (and (= (+ a b c) 180) (= a b c)) "Equilatero") ((if (and (= (+ a b c) 180)) (or (= a b)(= b c)(= a c))) "Isosceles" "Escaleno") else "Error")

(define (triangulo5 a b c)
  (if (> (+ a b c) 180) "Error" (if (= a b c) "Equilatero" (if (or (= a b) (= b c) (= a c)) "Isoceles" "Escaleno"))))

(triangulo5 60 100 80)


; 5. La contracción en el consumo ha obligado a El lápiz curioso a extender sus
; ofertas. Al ingresar a la librería, se lee el siguiente cartel:
; Lápices, llevando 5 o más: 15% de descuento.
; Cuadernos, llevando 4 o más: 10% de descuento.

(define PC 60)
(define PL 8)

; Estos valores representan el precio unitario de los cuadernos y lápices
; respectivamente. Defina una función que, dados dos valores c y l,
; devuelva el monto a pagar si se compran c cuadernos y l lápices. Sería
; bueno que en la definición aparezcan las constantes PL y PC, así su
; función será más fácil de modificar si hay cambios de precios.


; (define (cuaderno c)
;   (if(>= c 4)(* c PC 0.90)(* c PC)))
; 
; (define (lapices l)
;   (if(>= l 5)(* l PL 0.85)(* l PL)))
; 
; (define (compra c l)
;   (+(lapices l)(cuaderno c)))
; 


; alternativa

(define (compra c l)
  (+(if(>= c 4)(* c PC 0.90)(* c PC))
    (if(>= l 5)(* l PL 0.85)(* l PL))))

; 6. Luego de un tiempo, las cosas siguen difíciles para El lápiz curioso.
; Además del cartel del ejercicio anterior, se lee el siguiente:

; Llevando 10 o más unidades, 18% de descuento.

; Obviamente, si en una compra aplica más de una oferta, al cliente se le
; hace aquel descuento que más lo beneficie.
; Considere nuevamente la consigna del ejercicio anterior, pero defina una
; nueva función para contemplar la nueva oferta.
                                    
(define (superdescuento c l)
  (if (>= (+ c l)10)(+(* c PC 0.82)(* l PL 0.82))
  (+(if(>= c 4)(* c PC 0.90)(* c PC))
    (if(>= l 5)(* l PL 0.85)(* l PL)))))

; 7. Redefina, la función pitagorica? de la Práctica 0 usando if.

; (define (pitagorica? a b c)(=(sqr c) (+(sqr a)(sqr b))))
; (pitagorica? 3 4 5)
; (pitagorica? 11 60 61)

; (define (pitagorica? a b c)
;   (if(=(+ (sqr a)(sqr b))(sqr c))"Verdadero" "Falso"))
; 
; (pitagorica? 1 2 3)
; (pitagorica? 11 60 61)


; 8. Modifique el ejercicio anterior para que se genere un string en lugar de
; un booleano. En esta versión, esperamos que (pitagorica? 3 4 5) evalúe
; a "Los números 3, 4 y 5 forman una terna pitagórica." Ayuda: La
; función number->string puede resultar útil.

(define (pitagorica? a b c)
  (if(=(+(sqr a)(sqr b))(sqr c))
     (string-append "Los números "(number->string a)","(number->string b)" y "(number->string c)" forman una terna pitagórica")
     (string-append "Los números "(number->string a)", "(number->string b)" y "(number->string c)" no forman una terna pitagórica")))

(pitagorica? 1 2 3)
(pitagorica? 11 60 61)

; 9. Defina una función collatz que reciba un número natural n y devuelva
; n/2 si n es par, o 3*n+1 si n es impar.

(define (collatz n)
  (if (even? n) (/ n 2) 
    (+ 1 (* 3 n))))


; : : Banderas : :


; 1. Primero, nos pondremos de acuerdo en algunas
; definiciones comunes. La idea es que las banderas sean imágenes de 90 pixeles de ancho por 60 de alto. 
; Segundo, todas las banderas las dibujaremos sobre un marco del tamaño indicado. Este
; marco lo provee la función empty-scene. A modo de ejemplo, si uno
; escribe el siguiente código:

(define ejemplo (place-image (rectangle 90 30 "solid" "red")
                             45 15
(place-image (circle 10 "solid" "blue")
                                          45 45
(empty-scene 90 60))))

; Ahora sí, continúe con los ejercicios, dibujando en cada caso lo pedido.

; a. Perú

(define Perú (place-image(rectangle 30 60 "solid" "red")
                         15 30
                         (place-image(rectangle 30 60 "solid" "white")
                                     45 30
                                     (place-image(rectangle 30 60 "solid" "red")
                                                 75 30                                  
                                     (empty-scene 90 60)))))
                                     
                        
Perú

; b. Italia

(define Italia (place-image(rectangle 30 60 "solid" "green")
                         15 30
                         (place-image(rectangle 30 60 "solid" "white")
                                     45 30
                                     (place-image(rectangle 30 60 "solid" "red")
                                                 75 30                                  
                                     (empty-scene 90 60)))))

Italia

; c. Defina una única función que permita, de acuerdo al valor de sus
 ;parámetros, crear tanto la bandera de Perú, como la de Italia, como
; cualquier bandera que esté formada por tres bandas verticales de igual
; ancho.

(define (banderavertical c1 c2 c3)
  (place-image(rectangle 30 60 "solid" c1)
                         15 30
                         (place-image(rectangle 30 60 "solid" c2)
                                     45 30
                                     (place-image(rectangle 30 60 "solid" c3)
                                                 75 30                                  
                                     (empty-scene 90 60)))))

; c. Alemania

(define Alemania (place-image(rectangle 90 20 "solid" "black")
                             45 10
                             (place-image(rectangle 90 20 "solid" "red")
                                          45 30
                                          (place-image(rectangle 90 20 "solid" "yellow")
                                                      45 50
                                                      (empty-scene 90 60)))))

Alemania


; d. Holanda

(define Holanda (place-image(rectangle 90 20 "solid" "red")
                             45 10
                             (place-image(rectangle 90 20 "solid" "white")
                                          45 30
                                          (place-image(rectangle 90 20 "solid" "blue")
                                                      45 50
                                                      (empty-scene 90 60)))))


Holanda

; f. Defina una única función que permita, de acuerdo al valor de sus
; parámetros, crear tanto la bandera de Alemania, como la de Holanda,
; como cualquier otra bandera formada por tres bandas horizontales de
; igual alto.

(define (banderahorizontal c1 c2 c3)
  (place-image(rectangle 90 20 "solid" c1)
                             45 10
                             (place-image(rectangle 90 20 "solid" c2)
                                          45 30
                                          (place-image(rectangle 90 20 "solid" c3)
                                                      45 50
                                                      (empty-scene 90 60)))))


(banderahorizontal "green" "red" "brown")

; g. Defina una única función que dados tres colores y un sentido
; vertical/horizontal), permita definir las banderas anteriores.

(define (generarbandera c1 c2 c3 hv)(cond[(string=? hv "h")(banderahorizontal c1 c2 c3)]
                                         [(string=? hv "v")(banderavertical c1 c2 c3)]
                                         [else "Error"]))

(generarbandera "red" "white" "red" "v")

; h. Utilice dicha función para generar la bandera de Francia

(define Francia(generarbandera "blue" "white" "red" "v"))

Francia

; i. Utilizar dicha función para ayudarse a definir las banderas de Sudán,
; Argentina y Camerún.

; - Sudan

(define Sudán(place-image(rotate 270(triangle 90 "solid" "green"))
                         0 30
                         (generarbandera "red" "white" "black" "h")))

Sudán

(define Argentina(place-image(circle 8 "solid" "yellow")
                             45 30
                             (generarbandera "blue" "white" "blue" "h")))

Argentina

(define Camerún(place-image(star 10 "solid" "yellow")
                           45 30
                           (generarbandera "green" "red" "yellow" "v")))

Camerún

; j. La siguiente es más desafiante, Brasil:

(define Brasil(place-image(circle 14 "solid" "blue")
                          45 30
                          (place-image(rhombus 45 120 "solid" "yellow")
                                      45 30
                                      (generarbandera "green" "green" "green" "v"))))

Brasil

;k. Modifique el código para que las banderas se vean en el doble de su
;tamaño. ¿Debe modificar muchos sectores del código? Modifique las
;definiciones adecuadamente, utilizando constantes globales, para que
;los cambios a futuro sean más simples.

(define HEIGHT 60)
(define WIDTH 90)

(define (banderahorizontal_global c1 c2 c3)
  (place-image(rectangle WIDTH (/ HEIGHT 3) "solid" c1)
                             (/ WIDTH 2) (/ (/ HEIGHT 3) 2)
                             (place-image(rectangle WIDTH (/ HEIGHT 3) "solid" c2)
                                          (/ WIDTH 2) (+ (/ HEIGHT 3) (/ (/ HEIGHT 3) 2))
                                          (place-image(rectangle WIDTH (/ HEIGHT 3) "solid" c3)
                                                      (/ WIDTH 2) (+ (* 2 (/ HEIGHT 3)) (/ (/ HEIGHT 3) 2))
                                                      (empty-scene WIDTH HEIGHT)))))

(banderahorizontal_global "black" "red" "yellow") 
