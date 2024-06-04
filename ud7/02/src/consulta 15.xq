for $x in doc ("books")/bookstore/book/title
return (<libro><titulo>{$x/text()}</titulo>,<caracteres>{string-length($x)}</caracteres></libro>)

