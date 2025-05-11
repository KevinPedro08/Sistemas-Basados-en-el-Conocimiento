(deftemplate smartphone
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio)
   (slot qty))

(deftemplate computadora
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio)
   (slot qty))

(deftemplate accesorio
   (slot tipo)
   (slot marca)
   (slot modelo)
   (slot color)
   (slot precio)
   (slot compatibilidad)
   (slot qty))

(deftemplate cliente
   (slot id)
   (slot nombre)
   (slot direccion))

(deftemplate orden-compra
   (slot id)
   (slot cliente-id)
   (slot total)
   (slot qty)
   (slot tipo-producto)
   (slot producto)
   (slot reducir-existencias (default "si"))
)

(deftemplate tarjetacred
   (slot banco)
   (slot grupo)
   (slot exp-date)
   (slot nombre-titular))

(deftemplate vale
   (slot codigo)
   (slot descuento))
