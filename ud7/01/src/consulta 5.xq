(:Consulta 5 Listado Tabla:)

<html>
  <head>
    <title>Tabla de libros</title>   
    <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
  </head>
  <body>
  <main>
      <table>
        <thead>
          <tr>
            <th>Titulo</th>
            <th>Categoría</th>
          </tr>    
        </thead>
        <tbody>
            {
              for $x in doc('books')/bookstore/book          
              return <tr>
                <td>{$x/title/text()}</td>
                <td>{$x/@category/data()}</td>
              </tr>
            }    
        </tbody>        
      </table>
      
      <ul>
        {
          for $x in doc('books')/bookstore/book          
            return <li class="{$x/@category/data()}">{$x/title/text()}</li>
        }
      </ul>
    </main>
  </body>
</html>