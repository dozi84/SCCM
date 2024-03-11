# Count Disks
Write-Output "Checking the Drive Count..."
$diskCount = (Get-Disk).Number.Count

# Initialize SMS TS environment.
$TSEnv = New-Object -COMObject Microsoft.SMS.TSEnvironment
        
if ($diskCount -eq 1) 
    {
    Write-Output "Only 1 installed. Move along..."
    $TSEnv.Value("OSDDiskIndex") = (Get-WmiObject -Namespace root\microsoft\windows\storage -Class msft_disk).Number
    }

# If there's more than 1, check for NVMe's.
# Only NVMe disks larger than 120GB will be targeted.  This should exclude smaller Optane drives.
elseif ($diskCount -gt 1) 
    {
    Write-Output "There's more than 1 disk installed. Check if any NVMe's are installed."
    
    $nvmeDsks = (Get-WmiObject -Namespace root\microsoft\windows\storage -Class msft_disk) | 
        ?{$_.BusType -eq 17} | Where-Object {$_.Size -gt 128849018880}
    
    $i = $nvmeDsks.Count

    Write-Output "Found $i NVMe disk(s)"
    
# Identify the smallest disk to install the OS to
    Write-Output "Determining the smaller disk to assign as disk 0"
    $osDisk = ($nvmeDsks | Sort-Object -Property Size | Select-Object -First 1).Number
    
    Write-Output "Ready to deploy"
    }

if (!($nvmeDsks)) 
    {
    Write-Output "No NVMe disk found..."
    }          


# If there's NVMe's installed, set TS variable 'OSDDiskIndex' to the smallest one.

if ($nvmeDsks)
    {
    $TSEnv.Value("OSDDiskIndex") = $osDisk
    Write-Output "NVMe should now equal Disk 0 in the TS."
    }
