
for $x in doc("01")/datos/proveedores/proveedor[last()]
return 
concat(
'{"Nombre": ','"',$x/nombreprov/text(),'"',', ',
'"Numero proveedor": ','"',$x/@numprov,'"',', ',
'"Estado": ',$x/estado/text(),', ',
'"Ciudad": ','"',$x/ciudad/text(),'"',
'}'
)