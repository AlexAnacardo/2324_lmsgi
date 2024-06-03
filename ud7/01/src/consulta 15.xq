(: Consulta 15 :)


<libros>
  {
    for $x in doc("books")/bookstore
    let $y :=count($x/book)
    return ($x/book/title, <total>{$y}</total>)
  }
</libros>


(:
<libros>
  {
    for $x in doc("books")/bookstore/book
    return <libro>{$x/title/text()}</libro>
  }
  {
    for $x in doc("books")/bookstore
    let $y := count($x/book)
    return <total>{$y}</total>
  }
</libros>
:)