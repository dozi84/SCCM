winrm get winrm/config

Get-Item WSMan:\localhost\Client\TrustedHosts

Set-Item WSMan:\localhost\Client\TrustedHosts -Value 'DIAS-DEV-DZ'

Get-PSSession -ComputerName PRIMUSS-TS-VW.rz.fh-ingolstadt.de -Credential espl_001\zieglerd-adm -UseSSL

Enter-PSSession -ComputerName PRIMUSS-TS-VW.rz.fh-ingolstadt.de -Credential espl_001\zieglerd-adm -UseSSL

Import-Module RemoteDesktop

Get-RDCertificate | select role, Thumbprint
