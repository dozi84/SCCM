$FileVersion = Get-Process | Where ProcessName -Like PMenu | Get-Process -FileVersionInfo

Foreach ($Process in $FileVersion) { 
  If ($FileVersion.FileVersion -lt "2.2.2404.1") {
      Write-Host Alte Version! -Foregroundcolor "Red"
  }
  Else {
      Write-Host Aktuelle Version! -Foregroundcolor "Green"
  }
}
