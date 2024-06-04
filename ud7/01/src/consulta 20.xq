<resultado>
{
  for $x in doc("books")/bookstore/book
  return (<titulo>{$x/title/text()}</titulo>,<autores>{count($x/author)}</autores>)
}
</resultado>