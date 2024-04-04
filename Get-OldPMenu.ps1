# Alle PMenu Prozesse auslesen
$PMenuProcess = Get-Process PMenu* -IncludeUserName
# Version des aktuellen PMenu
$NewestVersion = "2.2.2404.1"

Write-Host "-----------------------------------------"
Write-Host ""
Write-Host "Aktuelle PMenu-Version:" $NewestVersion -ForegroundColor Green
Write-Host ""

# Jeden Prozess ausgeben
Foreach ($Process in $PMenuProcess) { 
  If ($Process.FileVersion -lt $NewestVersion) {
      Write-Host "Start:"$Process.StartTime "|" "Name:"$Process.Name "|" "Pfad:"$Process.Path "|" "Version:"$Process.FileVersion "|" "Benutzer:"$Process.UserName -Foregroundcolor "Red"
  }
  Else {
      Write-Host "Start:"$Process.StartTime "|" "Name:"$Process.Name "|" "Pfad:"$Process.Path "|" "Version:"$Process.FileVersion "|" "Benutzer:"$Process.UserName -Foregroundcolor "Green"
  }
}

Write-Host ""
Write-Host "-----------------------------------------"

# [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
# iex (irm 'https://raw.githubusercontent.com/dozi84/SCCM/main/Get-OldPMenu.ps1')
