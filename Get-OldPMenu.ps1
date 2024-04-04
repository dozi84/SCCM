$PMenuProcess = Get-Process PMenu* -IncludeUserName
$NewestVersion = "2.2.2404.1"

Foreach ($Process in $PMenuProcess) { 
  If ($Process.FileVersion -lt $NewestVersion) {
      Write-Host "Name:"$Process.Name "|" "Pfad:"$Process.Path "|" "Version:"$Process.FileVersion "|" "Benutzer:"$Process.UserName "|" "Alte Version!" -Foregroundcolor "Red"
  }
  Else {
      Write-Host "Name:"$Process.Name "|" "Pfad:"$Process.Path "|" "Version:"$Process.FileVersion "|" "Benutzer:"$Process.UserName "|" "Aktuelle Version!" -Foregroundcolor "Green"
  }
}
