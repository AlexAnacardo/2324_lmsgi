for $x in doc("books")/bookstore/book
return <salida>{concat($x/title/text()," ",count($x/author))}</salida>