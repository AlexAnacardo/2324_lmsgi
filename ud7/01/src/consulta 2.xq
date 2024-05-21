(:Consulta 2 Lista libros precio superior a 30:)

for $x in doc('books')/bookstore/book
where $x/price>30
order by $x/title
return $x/title/text()