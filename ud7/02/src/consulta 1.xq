
<libros>
  {
    for $x in doc("books")/bookstore/book
    where $x/year=2005 return
    <lib2005>
      <titulo>{$x/title/text()}</titulo>
      <autor>{$x/author/text()}</autor>
    </lib2005>
  }
</libros>