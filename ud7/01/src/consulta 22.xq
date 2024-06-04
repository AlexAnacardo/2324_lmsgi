for $x in doc ("books")/bookstore/book
where substring($x/year,4,1)="3"
return $x/title/text()