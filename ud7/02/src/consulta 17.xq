let $x := distinct-values(doc("books")/bookstore/book/author/text())
for $y in $x
return <autor>{$y}</autor>