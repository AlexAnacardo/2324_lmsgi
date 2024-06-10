for $x in doc("01")/datos/proveedores/proveedor
order by $x/ciudad/text(), $x/@numprov
return concat($x/ciudad/text(),'---',$x/@numprov)