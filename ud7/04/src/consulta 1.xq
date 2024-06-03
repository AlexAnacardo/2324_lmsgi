for $x in collection('academia')/aula
where $x/nombre="Aula 1"
return data($x/@id)