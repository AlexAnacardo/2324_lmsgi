let $x := distinct-values(doc("books")/bookstore/book/year)
for $y in $x
return <autor>{$y}</autor>