$FileVersion = Get-Process | Where ProcessName -Like PMenu | Get-Process -FileVersionInfo

Foreach ($Process in $FileVersion) { 
  If ($FileVersion.FileVersion -ge "2.2.2401.1") {
      Write-Host Aktuell!
  }
  Else {
      Write-Host Alt!
  }
}
