for $x in collection('academia')/curso
where data($x/fin)>current-date()
return $x/nombre/text()