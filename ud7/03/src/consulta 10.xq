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
            <th>Bailes</th>
            <th>Profesor</th>
          </tr>
        </thead>
        <tbody>
          {
            for $x in doc("bailes")/bailes/baile
            return
            <tr>
              <td>{$x/nombre/text()}</td>
              <td>{$x/profesor/text()}</td>
            </tr>
          }
        </tbody>
      </table>      
    </main>
  </body>
</html>