;;regla 1
(defrule mostrar-smartphones
   ?s <- (smartphone (marca ?marca) (modelo ?modelo) (qty ?qty))
   =>
   (printout t "Smartphone: " ?marca " " ?modelo " - Cantidad: " ?qty crlf)
)

;;regla 2
(defrule mostrar-computadoras
   ?c <- (computadora (marca ?marca) (modelo ?modelo) (qty ?qty))
   =>
   (printout t "Computadora: " ?marca " " ?modelo " - Cantidad: " ?qty crlf)
)

;;regla 3
(defrule mostrar-accesorios
   ?a <- (accesorio (tipo ?tipo) (marca ?marca) (modelo ?modelo) (qty ?qty))
   =>
   (printout t "Accesorio: " ?tipo " " ?marca " " ?modelo " - Cantidad: " ?qty crlf)
)

;;regla 4
(defrule samsung-note21-liverpool
   (orden-compra (id ?id) (producto "galaxyNote21") (cliente-id ?cid))
   (tarjetacred (banco "liverpool") (grupo "visa") (nombre-titular ?nombre))
   (cliente (id ?cid) (nombre ?nombre))
   =>
   (printout t "Gracias por tu compra orden " ?id ": Tu Galaxy Note 21 con tarjeta Liverpool VISA aplica para 12 meses sin intereses." crlf)
)

;;regla 5
(defrule compra-iphone16-banamex
   (orden-compra (id ?id) (producto "iPhone16") (cliente-id ?cid))
   (tarjetacred (banco "banamex") (nombre-titular ?nombre))
   (cliente (id ?cid) (nombre ?nombre))
   =>
   (printout t "Gracias por tu compra orden " ?id ": Tu iPhone16 con tarjeta Banamex aplica para 24 meses sin intereses." crlf)
)

;;regla 6
(defrule compra-macbookair-con-iphone16-efectivo
   ?o1 <- (orden-compra (id ?id1) (cliente-id ?cid) (tipo-producto "computadora") (producto "macbookair"))
   ?o2 <- (orden-compra (id ?id2&:(neq ?id1 ?id2)) (cliente-id ?cid) (tipo-producto "smartphone") (producto "iPhone16"))
   =>
   (bind ?total (+ (fact-slot-value ?o1 total) (fact-slot-value ?o2 total)))
   (bind ?vales (* (div ?total 1000) 100))
   (printout t "Gracias por tus compras cliente " ?cid " (tus órdenes " ?id1 " y " ?id2 "): Por la compra de un MacBook Air y un iPhone16 con efectivo te damos $" ?vales " pesos en vales." crlf)
)

;;regla 7
(defrule descuento-smartphone-accesorios
   (orden-compra (id ?id) (tipo-producto "smartphone"))
   =>
   (printout t "Gracias por tu compra Orden " ?id ": en la compra de tu Smartphone aplica un 10% de descuento para una funda." crlf)
)

;;regla 8
(defrule recomendar-mica
   (orden-compra (id ?id) (tipo-producto "accesorio") (producto "magSafe") (total ?total))
   =>
   (printout t "Te recomendamos comprar una mica para tu smartphone junto con la funda adquirida." crlf)
)

;;regla 9
(defrule pocos-accesorios
    (accesorio (tipo ?tipo) (modelo ?modelo) (qty ?qty))
    (test (< ?qty 10))
    =>
    (printout t "Quedan pocos accesorios (" ?tipo " - " ?modelo ") en inventario quedan: " ?qty " pzas." crlf)
)

;;regla 10
(defrule pocos-smartphones
    (smartphone (marca ?marca) (modelo ?modelo) (qty ?qty))
    (test (< ?qty 10))
    =>
    (printout t "Quedan pocos smartphone (" ?marca " " ?modelo ") en inventario quedan: " ?qty " pzas." crlf)
)

;;regla 11
(defrule pocas-computadoras
    (computadora (marca ?marca) (modelo ?modelo) (qty ?qty))
    (test (< ?qty 10))
    =>
    (printout t "Quedan pocas computadoras (" ?marca " " ?modelo ") en inventario quedan: " ?qty " pzas." crlf)
)

;;regla 12
(defrule promocion-computadora-apple-mayor-40
    (computadora (marca "apple") (modelo ?m) (precio ?p))
    (test (> ?p 40000))
    =>
    (printout t "Promoción especial en computadora Apple con precio mayor a 40000" ?m " de $" ?p crlf)
)

;;regla 13
(defrule descuento-mouse-aplicable
    ?o <- (orden-compra (id ?id) (tipo-producto "accesorio") (producto ?modelo))
    ?a <- (accesorio (tipo "mouse") (modelo ?modelo) (precio ?p))
    =>
    (bind ?descuento (* ?p 0.05)) ; ejemplo: 5% descuento
    (printout t "Descuento aplicado para el mouse: $" ?descuento crlf)
)

;;regla 14
(defrule factura-necesaria
    (orden-compra (id ?id) (total ?total))
    (test (> ?total 25000))
    =>
    (printout t "La Orden " ?id " supera los $25,000 por lo que necesita ser facturada." crlf)
)

;;regla 15
(defrule descuento-smartphone-por-mayor-20
    (smartphone (marca ?marca) (modelo ?modelo) (precio ?precio))
    (orden-compra (id ?id) (tipo-producto "smartphone") (producto ?modelo))
    (test (> ?precio 20000))
    =>
    (bind ?descuento (* ?precio 0.05)) ; 5% de descuento
    (printout t "Smartphone (" ?modelo ") con precio mayor a $20k ($" ?precio ")." crlf)
    (printout t "Descuento aplicado en smartphone de mas de $20k: $" ?descuento crlf)
)

;;regla 16
(defrule compra-realizada
    (orden-compra (cliente-id ?cid))
    =>
    (printout t "Cliente " ?cid " ha realizado una orden de compra." crlf)
)

;;regla 17
(defrule envio-gratis
    (orden-compra (id ?id) (total ?total))
    (test (> ?total 999))
    =>
    (printout t "La orden " ?id ": Aplica envío gratis por realizar una compra mayor a $999." crlf)
)

;;regla 18
(defrule compra-appleMusic
   (orden-compra (id ?id) (producto "iPhone16"))
   =>
   (printout t "La orden " ?id ": Se sugiere la compra de un mes de AppleMusic para tu dispositivo." crlf)
)

;;regla 19
(defrule envio-dia-siguiente
    (orden-compra (id ?id) (total ?total))
    (test (> ?total 1500))
    =>
    (printout t "La orden " ?id ": Aplica para envío al dia siguiente por realizar una compra mayor a $1500." crlf)
)

;;regla 20
(defrule regla-recomendacion-mousepad
   (orden-compra (id ?id) (producto "deathadder"))
   =>
   (printout t "Te sugerimos comprar un mousepad para tu nuevo mouse." crlf)
)

;;regla 21
(defrule clasificar-mayorista
   (orden-compra (id ?id) (cliente-id ?cid) (producto ?prod) (qty ?q&:(> ?q 10)))
   =>
   (printout t "Cliente " ?cid " es un mayorista en la orden N." ?id "." crlf))

;;regla 22
(defrule clasificar-menudista
   (orden-compra (id ?id) (cliente-id ?cid) (producto ?prod) (qty ?q&:(<= ?q 10)))
   =>
   (printout t "Cliente " ?cid " es un menudista en la orden N." ?id "." crlf))

;;regla 23
(defrule actualizar-cantidad-smartphone
   ?o <- (orden-compra (id ?id) (tipo-producto "smartphone") (producto ?modelo) (qty ?ordenQty) (reducir-existencias "si"))
   ?s <- (smartphone (modelo ?modelo) (qty ?stockQty))
   =>
   (if (>= ?stockQty ?ordenQty) then
      (progn
         (modify ?s (qty (- ?stockQty ?ordenQty)))
         (modify ?o (reducir-existencias "no"))
         (printout t "Unidades vendidas para el smartphone " ?modelo ": Quedan: " (- ?stockQty ?ordenQty) " pzas." crlf))
      else
      (progn
         (modify ?o (reducir-existencias "no"))
         (printout t "La orden " ?id " excede las unidades disponibles para el smartphone " ?modelo ". Quedan: " ?stockQty ", Se necesitan: " ?ordenQty crlf)))
)

;;regla 24
(defrule actualizar-cantidad-computadora
   ?o <- (orden-compra (id ?id) (tipo-producto "computadora") (producto ?modelo) (qty ?ordenQty) (reducir-existencias "si"))
   ?c <- (computadora (modelo ?modelo) (qty ?stockQty))
   =>
   (if (>= ?stockQty ?ordenQty) then
      (progn
         (modify ?c (qty (- ?stockQty ?ordenQty)))
         (modify ?o (reducir-existencias "no"))
         (printout t "Unidades vendidas para la computadora " ?modelo ": Quedan: " (- ?stockQty ?ordenQty) " pzas." crlf))
      else
      (progn
         (modify ?o (reducir-existencias "no"))
         (printout t "La orden " ?id " excede las unidades disponibles para la computadora " ?modelo ". Quedan: " ?stockQty ", Se necesitan: " ?ordenQty crlf)))
)

;;regla 25
(defrule actualizar-cantidad-accesorio
   ?o <- (orden-compra (id ?id) (tipo-producto "accesorio") (producto ?modelo) (qty ?ordenQty) (reducir-existencias "si"))
   ?a <- (accesorio (modelo ?modelo) (qty ?stockQty))
   =>
   (if (>= ?stockQty ?ordenQty) then
      (progn
         (modify ?a (qty (- ?stockQty ?ordenQty)))
         (modify ?o (reducir-existencias "no"))
         (printout t "Unidades vendidas para el accesorio " ?modelo ": Quedan: " (- ?stockQty ?ordenQty) " pzas." crlf))
      else
      (progn
         (modify ?o (reducir-existencias "no"))
         (printout t "La orden " ?id " excede las unidades disponibles para el accesorio " ?modelo ". Quedan: " ?stockQty ", Se necesitan: " ?ordenQty crlf)))
)
