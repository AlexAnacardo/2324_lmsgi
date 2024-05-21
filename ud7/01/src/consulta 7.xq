(: Consulta 7 :)

<books>
{
  for $x at $y in doc("books")/bookstore/book
  return <book>{$y}. {data($x/title)}</book>
}
</books>