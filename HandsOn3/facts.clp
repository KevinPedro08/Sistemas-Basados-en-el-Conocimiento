(deffacts computadoras
   (computadora (marca "apple") (modelo "macbookpro") (color "plata") (precio 47000) (qty 19))
   (computadora (marca "hp") (modelo "victus") (color "negro") (precio 22000)(qty 11))
   (computadora (marca "hp") (modelo "omen") (color "negro") (precio 35000)(qty 10))
   (computadora (marca "lenovo") (modelo "ideapad 3x`") (color "azul") (precio 12000) (qty 15))
   (computadora (marca "lenovo") (modelo "legion") (color "azul") (precio 22000) (qty 18))
)

(deffacts smartphones
   (smartphone (marca "apple") (modelo "iPhone16") (color "blanco") (precio 22000) (qty 12))
   (smartphone (marca "samsung") (modelo "galaxyNote21") (color "azul") (precio 25000) (qty 30))
   (smartphone (marca "samsung") (modelo "galaxyS25") (color "azul") (precio 25000) (qty 30))
   (smartphone (marca "xiaomi") (modelo "redmiNote13pro") (color "negro") (precio 8000) (qty 25))
   (smartphone (marca "xiaomi") (modelo "pocox7pro") (color "plata") (precio 7000)(qty 21))
   (smartphone (marca "samsung") (modelo "A54") (color "negro") (precio 5000) (qty 22))
)

(deffacts accesorios
   (accesorio (tipo "funda") (marca "apple") (modelo "magSafe") (color "azul") 
       (precio 1000) (compatibilidad "iphone") (qty 60))
   (accesorio (tipo "cargador") (marca "1Hora") (modelo "cargaRapida") (color "blanco") 
       (precio 200) (compatibilidad "universal") (qty 40))
   (accesorio (tipo "audifonos") (marca "jbl") (modelo "tune235nc") (color "negro") 
       (precio 1200) (compatibilidad "bluetooth") (qty 15))
   (accesorio (tipo "mouse") (marca "razer") (modelo "deathadder") (color "gris") 
       (precio 500) (compatibilidad "universal") (qty 20))
)

(deffacts clientes
   (cliente (id "1") (nombre "Oliver") (direccion "blablabla123"))
   (cliente (id "2") (nombre "Abril") (direccion "blablabla1234"))
   (cliente (id "3") (nombre "Javier") (direccion "blablabla1235"))
   (cliente (id "4") (nombre "Luz") (direccion "blablabla1236"))
   (cliente (id "5") (nombre "Marco") (direccion "blablabla12364"))
)

(deffacts tarjetas-credito
   (tarjetacred (banco "liverpool") (grupo "visa") (exp-date "12/27") (nombre-titular "Oliver"))
   (tarjetacred (banco "banamex") (grupo "mastercard") (exp-date "11/26") (nombre-titular "Abril"))
   (tarjetacred (banco "bbva") (grupo "visa") (exp-date "01-12-25") (nombre-titular "Oliver"))
   (tarjetacred (banco "santander") (grupo "mastercard") (exp-date "01-11-25") (nombre-titular "María Gómez"))
   (tarjetacred (banco "hsbc") (grupo "visa") (exp-date "01-09-25") (nombre-titular "Luz"))
)

(deffacts vales
   (vale (codigo "111") (descuento 5))
   (vale (codigo "222") (descuento 10))
   (vale (codigo "333") (descuento 15))
   (vale (codigo "444") (descuento 20))
)

