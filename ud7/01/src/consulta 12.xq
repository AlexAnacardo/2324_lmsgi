(: Consulta 12 :)
(:
<publicacion>
{
  for $x in doc("books")/bookstore/book 
  return $x/year
}
</publicacion>
:)


 
let $x := doc("books")/bookstore/book/year
return <publicacion>{ $x }</publicacion>
 
