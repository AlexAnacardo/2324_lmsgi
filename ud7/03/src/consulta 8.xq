<bailes>
  {
    for $x in doc("bailes")/bailes/baile
    return(<nombre>{$x/nombre}</nombre>,<precio>{$x/precio/text()}</precio>,
    <precioDesc>{$x/precio/text()-($x/precio/text()*0.15)}</precioDesc>)
  }
</bailes>