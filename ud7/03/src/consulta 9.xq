<bailes>
  {
    for $x in doc("bailes")/bailes/baile
    return
    (
      <baile>
      <nombre>{$x/nombre/text()}</nombre>,
      <precio>{$x/precio/text()}</precio>,
      <plazas>{$x/plazas/text()}</plazas>,
      <profesor>{$x/profexor/text()}</profesor>,
      <sala>{$x/sala/text()}</sala>
      </baile>
    )
  }
</bailes>