<total>
{
  let $t := doc("books")/bookstore/book/price
  return sum($t)
}
</total>