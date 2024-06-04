<resultado>
  {
    for $x in doc("books")//book
    return <precio>{$x/price/text()}</precio>
  }
  <total>
    {
      let $t := doc("books")/bookstore/book/price
      return sum($t)
    }
  </total>
</resultado>