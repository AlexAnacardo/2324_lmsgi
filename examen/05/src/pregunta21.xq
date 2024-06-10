for $x in datos/productos/producto[color='Rojo']
return concat($x/@numproducto,'--',avg(/datos/suministros/suministra[numproducto=$x/@numproducto]/cantidad))
