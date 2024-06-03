for $x in collection('academia')/curso
for $y in collection('academia')/aula[nombre="Aula 1"]
where $x/aula=$y/@id
return $x/nombre/text()