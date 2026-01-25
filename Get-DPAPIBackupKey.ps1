# Direct ADSI search
$searcher = New-Object DirectoryServices.DirectorySearcher
$searcher.SearchRoot = New-Object DirectoryServices.DirectoryEntry("LDAP://CN=System,DC=domain,DC=com")
$searcher.Filter = "(objectClass=secret)"
$searcher.PropertiesToLoad.Add("*")
$results = $searcher.FindAll() foreach ($result in $results) {
    $name = $result.Properties["name"][0]
    Write-Host "=== Key Name: $name ==="

    # Check all properties for binary data
    foreach ($propName in $result.Properties.PropertyNames) {
        $propValue = $result.Properties[$propName][0]
        if ($propValue -is [byte[]]) {
            Write-Host "$propName : $($propValue.Length) bytes"
            if ($propValue.Length -gt 0) {
                [System.IO.File]::WriteAllBytes("$name-$propName.key", $propValue)
                Write-Host "  -> Saved to $name-$propName.key"
            }
        }
    }
}
