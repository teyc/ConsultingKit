$j = Get-Content "schema-org.json" | ConvertFrom-Json

# Finds any labels with 'name'
$j."@graph" `
| Where-Object { $_."@type" -eq "rdf:Property" }  `
| Select-Object -first 2000 -Property "rdfs:label","schema:domainIncludes" `
| Where-Object { $_."rdfs:label" -match "name" } `
| Sort-Object { $_."rfds:label" } `
| Format-Table -AutoSize


# Finds any labels with 'name'
$j."@graph" `
| Where-Object { $_."@type" -eq "rdf:Property" }  `
| Where-Object { $_."schema:domainIncludes"."@id" -eq "schema:TrainTrip" }  `
| Select-Object -first 2000 -Property "rdfs:label","schema:domainIncludes" `
| Where-Object { $_."rdfs:label" -match "name" } `
| Sort-Object { $_."rfds:label" } `
| Format-Table -AutoSize


# Finds any classes
$j."@graph" `
| Sort-Object "rfds:Label" `
| Where-Object { $_."@type" -eq "rdfs:Class" }  `
| Select-Object -first 2000 -Property "rdfs:label","schema:domainIncludes" `
| Sort-Object { $_."rdfs:label" }
| Format-Table -AutoSize