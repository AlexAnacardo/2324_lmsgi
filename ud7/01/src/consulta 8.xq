(: Consulta 8 :)

<html>
  <head>
    <title>Ud7-8 Alex Asensio Sanchez</title>
    <link href="css/estilos.css" type="text/css" rel="stylesheet"/>
  </head>
  <body>
    <header>
      <h1>Listado de practicas</h1>
    </header>
    <main>
      {
        for $tema in (1 to 8), $y in (1,2,3)
        return
        <div>
        <a href="{concat($tema,"/",$y,".html")}">Tema: {$tema} Ejercicio: {$y}</a>
        </div>        
      }
    </main>
  </body>
</html>