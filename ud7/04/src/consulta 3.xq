for $x in collection('academia')/curso
return concat($x/nombre/text(), " ",$x/precio/@cuota, " ", $x/precio/text())