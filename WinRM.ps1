winrm get winrm/config

Get-Help New-RDSessionDeployment

Get-Item WSMan:\localhost\Client\TrustedHosts

Set-Item WSMan:\localhost\Client\TrustedHosts -Value 'DIAS-DEV-DZ'

Get-PSSession -ComputerName PRIMUSS-TS-VW.rz.fh-ingolstadt.de -Credential espl_001\zieglerd-adm -UseSSL

Enter-PSSession -ComputerName PRIMUSS-TS-VW.rz.fh-ingolstadt.de -Credential espl_001\zieglerd-adm -UseSSL

New-PSSession -ComputerName PRIMUSS-TS-VW.rz.fh-ingolstadt.de -Credential espl_001\zieglerd-adm -UseSSL

Import-Module RemoteDesktop

Get-RDCertificate -ConnectionBroker PRIMUSS-TS-VW.rz.fh-ingolstadt.de | select role, Thumbprint

New-RDRemoteApp -ConnectionBroker PRIMUSS-TS-VW.rz.fh-ingolstadt.de -CollectionName "PRIMUSS" -DisplayName "PMenu" -FilePath "C:\Remote\prStart.exe" -IconPath "\\vw-fs\primuss\Primuss\PMenu.exe"

Get-RDRemoteApp -ConnectionBroker PRIMUSS-TS-VW.rz.fh-ingolstadt.de

Get-RDRemoteApp -ConnectionBroker vw-ts-primuss.rz.fh-ingolstadt.de

Set-RDRemoteApp -ConnectionBroker PRIMUSS-TS-VW.rz.fh-ingolstadt.de -Alias prStart -DisplayName "PMenu Lokal"

Exit-PSSession
