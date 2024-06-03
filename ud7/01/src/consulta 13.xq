(: Consulta 13 :)
<libros>
{
  for $x in doc("books")/bookstore/book order by $x/@category, $x/title/text()
  return $x
}
</libros>