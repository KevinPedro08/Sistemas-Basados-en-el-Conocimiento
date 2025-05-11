

(assert (orden-compra (id "1") (cliente-id "1") (total 25000) 
        (qty 1) (tipo-producto "smartphone") (producto "galaxyNote21") (reducir-existencias "si")))

(assert (orden-compra (id "2") (cliente-id "2") (total 20000) 
        (qty 1) (tipo-producto "smartphone") (producto "iPhone16") (reducir-existencias "si")))

(assert (orden-compra (id "1") (cliente-id "5") (total 40000) 
        (qty 1) (tipo-producto "computadora") (producto "macbookair") (reducir-existencias "si")))

(assert (orden-compra (id "2") (cliente-id "5") (total 20000) 
        (qty 1) (tipo-producto "smartphone") (producto "iPhone16") (reducir-existencias "si")))