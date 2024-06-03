for $x in collection('academia')/curso
for $y in collection('academia')/profesor[dni="33856315"]
where $x/profesor=$y/nombre
return $x/nombre