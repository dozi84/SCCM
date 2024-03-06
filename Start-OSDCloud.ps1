# Verbindung zum Tasksequenz-Objekt herstellen
$tsenv = New-Object -COMObject Microsoft.SMS.TSEnvironment

# TS-Variablen an PS-Script übergeben
$OSName     = $tsenv.Value('ZT_OS')
$OSBuild    = $tsenv.Value('ZT_OS_Build')
$OSEdition  = $tsenv.Value('ZT_OS_ED')
$OSLanguage = $tsenv.Value('ZT_OS_LANG')

# cmtrace starten
#cmtrace x:\windows\temp\smstslog\smsts.log

#Write-Output "--------------------------------------"
#Write-Output ""
#Write-Output "OSDCloud Apply OS Step"
#Write-Output ""
#Write-Output $OSName
#Write-Output $OSBuild 
#Write-Output $OSEdition
#Write-Output $OSLanguage
#Write-Output ""

# Festplatte-Partition und Formatierung überspringen, wird von der TS selbst erledigt
$Global:MyOSDCloud = [ordered]@{
        SkipAllDiskSteps    = [bool]$True
    }

#Write-Output "Global:MyOSDCloud"
#$Global:MyOSDCloud

# Launch OSDCloud
#Write-Output "Launching OSDCloud"
#Write-Output ""
# TsProgress ausblenden
#(New-object -ComObject Microsoft.SMS.TsProgressUI).CloseProgressDialog()
#Invoke-Expression 'cmd.exe /c start /wait %SYSTEMROOT%\System32\WindowsPowershell\v1.0\powershell.exe -ep bypass -command { Start-OSDCloud -ZTI -OSVersion "Windows 11" -OSBuild "23H2" -OSEdition "Enterprise" -OSLanguage "de-de" -Firmware ; Read-Host }'
Start-OSDCloud -ZTI -OSVersion $OSName -OSBuild $OSBuild -OSEdition $OSEdition -OSLanguage $OSLanguage -Firmware

#Write-Output ""
#Write-Output "--------------------------------------"
#Get-Process -Name cmtrace | Stop-Process
