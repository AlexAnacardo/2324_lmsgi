for $x in doc ("books")/bookstore/book
where substring($x/@category,1,1)="c"
return $x/title/text()