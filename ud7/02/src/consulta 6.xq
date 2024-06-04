
<resultado>
  {
    let $x := doc("books")/bookstore/book
    return (<minimo>{min($x/price)}</minimo>,<maximo>{max($x/price)}</maximo>)
  }
</resultado>