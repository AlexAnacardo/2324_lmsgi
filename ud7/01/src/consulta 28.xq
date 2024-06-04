<html>
  <head>
    <title>Ud7-27 Alex Asensio Sanchez</title>
  </head>
  <body>
    <header>
      <h1>Listado de libros</h1>
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th>Libros</th>
          </tr>
        </thead>
        <tbody>
          {
            for $x in doc("books")/bookstore/book
            return
            <tr>
              <td>{$x/title/text()}</td>
            </tr>
          }
        </tbody>
      </table>      
    </main>
  </body>
</html>