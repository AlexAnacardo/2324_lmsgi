<libros>
  {
    for $x in doc("books")/bookstore/book
    let $iva := $x/price*1.21
    order by $iva
    return <libro>{concat($x/title," ", $x/price," ", $iva)}</libro>
  }
</libros>
