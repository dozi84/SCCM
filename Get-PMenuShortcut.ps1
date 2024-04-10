function Get-Shortcut {
  param(
    $path = $null
  )
  
  $obj = New-Object -ComObject WScript.Shell

  if ($path -eq $null) {
    $pathUser = [System.Environment]::GetFolderPath('StartMenu')
    $pathCommon = $obj.SpecialFolders.Item('AllUsersStartMenu')
    $path = dir $pathUser, $pathCommon -Filter *.lnk -Recurse 
  }
  if ($path -is [string]) {
    $path = dir $path -Filter *.lnk
  }
  $path | ForEach-Object { 
    if ($_ -is [string]) {
      $_ = dir $_ -Filter *.lnk
    }
    if ($_) {
      $link = $obj.CreateShortcut($_.FullName)

      $info = @{}
      $info.Hotkey = $link.Hotkey
      $info.TargetPath = $link.TargetPath
      $info.LinkPath = $link.FullName
      $info.Arguments = $link.Arguments
      $info.Target = try {Split-Path $info.TargetPath -Leaf } catch { 'n/a'}
      $info.Link = try { Split-Path $info.LinkPath -Leaf } catch { 'n/a'}
      $info.WindowStyle = $link.WindowStyle
      $info.IconLocation = $link.IconLocation

      New-Object PSObject -Property $info
    }
  }
}

function Set-Shortcut {
  param(
  [Parameter(ValueFromPipelineByPropertyName=$true)]
  $LinkPath,
  $Hotkey,
  $IconLocation,
  $Arguments,
  $TargetPath
  )
  begin {
    $shell = New-Object -ComObject WScript.Shell
  }
  
  process {
    $link = $shell.CreateShortcut($LinkPath)

    $PSCmdlet.MyInvocation.BoundParameters.GetEnumerator() |
      Where-Object { $_.key -ne 'LinkPath' } |
      ForEach-Object { $link.$($_.key) = $_.value }
    $link.Save()
  }
}

$UsersProfiles = Get-ChildItem -Path C:\Users

Foreach ($UserProfile in $UsersProfiles) {

    $UserProfileDesktopPath = "C:\Users\" + $UserProfile.Name + "\Desktop"
    $UserProfileShortCuts = Get-Shortcut -Path $UserProfileDesktopPath | Where Target -like "PMenu*"
    
    If ($UserProfileShortCuts.Target -like "*PMenu*") {
        Write-Host "Benutzer:"$UserProfile.Name "Name:"$UserProfileShortCuts.Target "Pfad:"$UserProfileShortCuts.TargetPath
    }
    Else {
    }
}

#Get-Shortcut -Path C:\Users
#Set-Shortcut -LinkPath "C:\Users\zieglerd-adm\Desktop\PMenu.lnk" -TargetPath "Y:\PMenu_2.exe" -IconLocation "Y:\PMenu_2.exe"

#cls
