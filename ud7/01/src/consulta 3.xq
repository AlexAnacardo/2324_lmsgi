(:Consulta 3 Lista libros precio>30 en html:)
<html>
  <head>
    <title>Lista de libros</title>
  </head>
  <body>
    <ul>
      {
        for $x in doc('books')/bookstore/book
        where $x/price>30
        order by $x/title
        return <li>{$x/title/text()}</li>
      }
    </ul>
  </body>
</html>
