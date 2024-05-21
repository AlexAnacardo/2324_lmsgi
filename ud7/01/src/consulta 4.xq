 (:Consulta 4 Xml:)

<libros>
{
  for $x in doc('books')//book
  return if($x/@category='children')
  then
    <children>
      {$x/title/text()}
    </children>
  else
    <adult>
      {$x/title/text()}
    </adult>
}
</libros>