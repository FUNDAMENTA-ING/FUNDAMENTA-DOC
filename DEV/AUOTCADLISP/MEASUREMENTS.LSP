;:::::::::::::::::::: RECOPILACION DE LISP's PARA MEDICIONES (2/03/2004):::::::::::::::::::::::::::::
;********************************* CAMINO CONSECUTIVO **********************************
;Modificado por InnerCity <itspanish@iespana.es> <http://www.iespana.es/itspanish/>

(defun c:sumcam ()
 (setvar "cmdecho" 0)
 (graphscr)
 (setq 
  p1 (getpoint "\nSelecciona el primer punto: ")
  p2 (getpoint p1 "\nSelecciona el siguiente punto: ")
  d1 (distance p1 p2)
  prdist (strcat "\nDistancia inicial: " (rtos d1))
 )
 (princ prdist)
 (setq p3 (getpoint p2 "\nSelecciona el siguiente punto o ENTER para acabar"))
 (while p3
  (setq
   d0 (distance p2 p3)
   d1 (+ (distance p2 p3) d1)
   p2 p3
   prdist (strcat "\nDistancia parcial: " (rtos d0) ", Distancia acumulada: " (rtos d1))
  )
  (princ prdist)
  (setq p3 (getpoint p2 "\nSelecciona el siguiente punto o ENTER para acabar: "))
 )
 (setq cumd (strcat "Distancia total: " (rtos d1)))
 (prompt cumd)
 (princ)
) 

    
;********************************* CAMINO NO CONSECUTIVO ********************************
;Running distance calculator
;Modificado por InnerCity <itspanish@iespana.es> <http://www.iespana.es/itspanish/>

(defun c:sumcnc (/ pt1 pt2 d0 d1 )
  (graphscr)
  (setvar "CMDECHO" 0)
  (setq pt1 (getpoint " Selecciona el primer punto: "))(terpri)
  (setq pt2 (getpoint " Selecciona el siguiente punto: " pt1))(terpri)
  (setq d1 (distance pt1 pt2))
  (prompt " Distancia inicial: ")(prompt (rtos d1 2 4))      
    (while
    (setq pt1 (getpoint "\nSelecciona el siguiente primer punto o ENTER para acabar: " )) (terpri)
    (setq pt2 (getpoint " Selecciona el siguiente punto: " pt1 )) (terpri)
    (setq d0 (distance pt1 pt2))
    (setq d1 (+ (distance pt1 pt2) d1))
    (prompt "Distancia parcial: ")(prompt (rtos d0 2 4))(prompt " Distancia acumulada: ")(prompt (rtos d1 2 4))
  )
  (prompt "Distancia total: ")(prompt (rtos d1 2 4))
  (princ)
)

; ----------------------------------------------------------------------
;               (Returns the sum of selected arc objects)
;            Copyright (C) 1998 DotSoft, All Rights Reserved
; ----------------------------------------------------------------------


(defun c:sumarco ()
  (setq tlen 0.0)
  (setq sset (ssget '((0 . "ARC"))))
  (setq num (sslength sset) itm 0)
  (while (< itm num)
    (setq hnd (ssname sset itm))
    (setq ent (entget hnd))
    (setq rads (cdr (assoc 40 ent)))
    (setq sang (cdr (assoc 50 ent)))
    (setq eang (cdr (assoc 51 ent)))
    (if (> eang sang)
      (setq iang (- eang sang))
      (setq iang (+ (- 6.28319 sang) eang))
    )
    (setq larc (* iang rads))
    (setq tlen (+ tlen larc))
    (setq itm (1+ itm))
  )
  (princ (strcat "\nLongitud Total: " (rtos tlen)))
  (princ)
)

; ----------------------------------------------------------------------
;               (Returns the sum of selected line objects)
;            Copyright (C) 1997 DotSoft, All Rights Reserved
; ----------------------------------------------------------------------

; Para lineas con diferente cota en sus extremos se tomara la longitud real (3D Longitud), no la proyectada.

(defun C:sumlinea ()
  (setq sset (ssget '((0 . "LINE"))))
  (if sset
    (progn
      (setq tot 0.0)
      (setq num (sslength sset) itm 0)
      (while (< itm num)
        (setq hnd (ssname sset itm))
        (setq ent (entget hnd))
        (setq pt1 (cdr (assoc 10 ent)))
        (setq pt2 (cdr (assoc 11 ent)))
        (setq dis (distance pt1 pt2))
        (setq tot (+ tot dis))
        (setq itm (1+ itm))
      )
      (princ (strcat "\nLongitud Total: " (rtos tot)))
    )
  )
  (princ)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Written by Joshua M Orth. February 2000
; Modificado por InnerCity <itspanish@iespana.es> <http://www.iespana.es/itspanish/>


(defun C:sumlp (/ p l e sxy exy sum1 sum2 sum3)
   (setq p  (ssget   (list (cons -4 "<or")
                              (cons 0 "LINE")
                              (cons 0 "LWPOLYLINE")
                              (cons -4 "<and")
                                 (cons 0 "POLYLINE")
                                 (cons -4 "<not")
                                    (cons -4 "&") (cons 70 (+ 16 32 64))
                                 (cons -4 "not>")
                              (cons -4 "and>")
                           (cons -4 "or>")
                     )
            )
         sum1 0.0
         sum2 0.0
         sum3 0.0
   )
   ;check for null selection set
   (if p
      (progn
         (setq l 0)
         (repeat (sslength p)
            (cond
               ((= "LINE" (cdr (assoc 0 (setq e (entget (ssname p l))))))
                  (setq sxy (cdr (assoc 10 e))
                        exy (cdr (assoc 11 e))
                        sum1 (+ sum1 (distance sxy exy))
                  )
                  (terpri)
               )
               ((= "LWPOLYLINE" (cdr (assoc 0 (entget (setq e (ssname p l))))))
                  (command "_.area" "_E" e)
                  (setq sum2 (+ sum2 (getvar "perimeter")))
                  (terpri)
               )
               ((= "POLYLINE" (cdr (assoc 0 (entget (setq e (ssname p l))))))
                  (command "_.area" "_E" e)
                  (setq sum2 (+ sum2 (getvar "perimeter")))
                  (terpri)
               )
            )
            (setq l (1+ l))
         )
         (setq sum3 (+ sum1 sum2))
         (princ "\nLa suma total de longitudes para lineas es: ")
         (princ (rtos sum1))
         (princ "\nLa suma total de longitudes para polilineas es: ")
         (princ (rtos sum2))
         (princ "\nLa suma total de longitudes para lineas y/o polilineas es: ")
         (princ (rtos sum3))
      )
      (princ "\nNo has seleccionado ninguna linea o polilinea") 
   )
   (princ)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Suma el area y perimetro de distintas polilineas mediante seleccion directa
; Written by Joshua M Orth. February 2000
; Readaptado por InnerCity <itspanish@iespana.es> <http://www.iespana.es/itspanish/>


(defun C:sumarea (/ p l e sum1 sum2)
   (setq p  (ssget   (list (cons -4 "<or")
                              (cons 0 "LWPOLYLINE")
                              (cons -4 "<and")
                                 (cons 0 "POLYLINE")
                                 (cons -4 "<not")
                                    (cons -4 "&") (cons 70 (+ 16 32 64))
                                 (cons -4 "not>")
                              (cons -4 "and>")
                           (cons -4 "or>")
                     )
            )
         sum1 0.0
         sum2 0.0
   )
   ;check for null selection set
   (if p
      (progn
         (setq l 0)
         (repeat (sslength p)
            (cond
               ((= "LWPOLYLINE" (cdr (assoc 0 (entget (setq e (ssname p l))))))
                  (command "_.area" "_E" e)
                  (setq sum1 (+ sum1 (getvar "area")))
                  (setq sum2 (+ sum2 (getvar "perimeter")))
                  (terpri)
               )
               ((= "POLYLINE" (cdr (assoc 0 (entget (setq e (ssname p l))))))
                  (command "_.area" "_E" e)
                  (setq sum1 (+ sum1 (getvar "area")))
                  (setq sum2 (+ sum2 (getvar "perimeter")))
                  (terpri)
               )
            )
            (setq l (1+ l))
         )
         (princ "\nLa suma total de perimetros/longitudes es: ")
         (princ (rtos sum2))
         (princ "\nLa suma total de areas es: ")
         (princ (rtos sum1))
      )
      (princ "\nNo has seleccionado ninguna polilinea") 
   )
   (princ)
)

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
; SUMLCAPA program, modified by Joshua M Orth. February 2000
; Modificado por InnerCity <itspanish@iespana.es> <http://www.iespana.es/itspanish/>


(defun C:sumlcapa ( / l suml en sumln)



   (defun sumln ( / count ss1 e sxy exy)
      (setq suml 0.0)
      (if (=(type l)'STR)
         (progn
            (setq ss1 (ssget "_X" (list (cons 0 "LINE") (cons 8 l)))
                  count 0
            )
            (if ss1
               (progn
                  (princ "\n")(princ(sslength ss1))(princ " lineas encontradas") 
                  (princ "\nEspere, por favor ") 
                  (repeat (sslength ss1)
                     (setq e (entget (ssname ss1 count))
                           sxy (cdr (assoc 10 e))
                           exy (cdr (assoc 11 e))
                           suml (+ suml (distance sxy exy))
                           count (1+ count)
                     )
                  )
               )
               (princ (strcat "\nNo se han encontrado lineas en la capa: " l)) 
            )
         )
      )
   )


   (while (not (setq en (entsel "\nSelecciona la capa de trabajo: ")))) 
   (setq l (cdr (assoc 8 (entget (car en)))))

   (sumln)
   (princ (strcat "\nLongitud total de las lineas: " (rtos suml)))
   (princ)
)


(prompt "\n*** Conjunto de rutinas para mediciones correctamente cargadas ***")
(prin1)
