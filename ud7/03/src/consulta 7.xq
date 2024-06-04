for $x in doc("bailes")/bailes/baile[substring(profesor,1,5)="Laura"]
return $x/plazas*$x/precio