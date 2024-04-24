winrm get winrm/config

Get-Help New-RDSessionDeployment

Get-Item WSMan:\localhost\Client\TrustedHosts

Set-Item WSMan:\localhost\Client\TrustedHosts -Value 'DIAS-DEV-DZ'

Get-PSSession -ComputerName PRIMUSS-TS-VW.rz.fh-ingolstadt.de -Credential espl_001\zieglerd-adm -UseSSL

Enter-PSSession -ComputerName PRIMUSS-TS-VW.rz.fh-ingolstadt.de -Credential espl_001\zieglerd-adm -UseSSL

New-PSSession -ComputerName PRIMUSS-TS-VW.rz.fh-ingolstadt.de -Credential espl_001\zieglerd-adm -UseSSL

Import-Module RemoteDesktop

Get-RDCertificate -ConnectionBroker PRIMUSS-TS-VW.rz.fh-ingolstadt.de | select role, Thumbprint

New-RDRemoteApp -ConnectionBroker PRIMUSS-TS-VW.rz.fh-ingolstadt.de -CollectionName "PRIMUSS" -DisplayName "PMenu Y" -FilePath "Y:\Primuss\PMenu.exe" -IconPath "Y:\Primuss\PMenu.exe"

Get-RDRemoteApp -ConnectionBroker PRIMUSS-TS-VW.rz.fh-ingolstadt.de

Get-RDRemoteApp -ConnectionBroker PRIMUSS-TS.rz.fh-ingolstadt.de

Set-RDRemoteApp -ConnectionBroker PRIMUSS-TS-VW.rz.fh-ingolstadt.de -CollectionName "PRIMUSS" -Alias prStart -DisplayName "PMenu Lokal"

Remove-RDRemoteApp -ConnectionBroker PRIMUSS-TS-VW.rz.fh-ingolstadt.de -CollectionName "PRIMUSS" -Alias prStart

Exit-PSSession
