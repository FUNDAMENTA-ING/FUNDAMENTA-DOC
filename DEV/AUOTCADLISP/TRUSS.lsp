(defun dibujar-zigzag (altura separacion longitud)
  (setq puntos '()) ; Lista para almacenar los puntos del zigzag
  (setq n (1+ (fix (/ longitud separacion)))) ; Calcular la cantidad de diagonales

  ; Generar los puntos del zigzag
  (setq x 0.0)
  (setq y 0.0)
  (setq i 0)
  (while (< i n)
    (setq punto1 (list x y))
    (setq punto2 (list (+ x separacion) altura))
    (setq punto3 (list (+ x (* 2 separacion)) y))
    (setq puntos (append puntos (list punto1 punto2 punto3)))
    (setq x (+ x (* 2 separacion)))
    (setq i (1+ i))
  )

  ; Dibujar la polilínea
  (command "_.pline")
  (foreach punto puntos
    (command punto)
  )
  (command "")
  (princ)
)

(defun c:TRUSS ()
  (setq altura (getreal "\nIngrese la altura del zigzag: "))
  (setq separacion (getreal "\nIngrese la separación entre líneas: "))
  (setq longitud (getreal "\nIngrese la longitud total del zigzag: "))
  (dibujar-zigzag altura separacion longitud)
)
