for $x in doc ("books")/bookstore/book
where contains(upper-case($x/title/text()),"X")
return $x/title/text()