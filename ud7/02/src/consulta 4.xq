(: Consulta 14 :)

<total>
  {
    for $x in doc("books")/bookstore
    return count($x/book)
  }
</total>