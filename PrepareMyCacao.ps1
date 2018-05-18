*# Description: Boxstarter Script  
# Author: Laurent Kempé
# Dev settings for my app development

Disable-UAC

#--- Windows Features ---
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

#--- File Explorer Settings ---
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

#--- Windows Subsystems/Features ---
choco install -y Microsoft-Hyper-V-All -source windowsFeatures
choco install -y Microsoft-Windows-Subsystem-Linux -source windowsfeatures

#Define Packages to Install
$Packages = 'git',`
            'poshgit',`
            'visualstudiocode',`
            'notepadplusplus',`
            'nodejs',`
            'FiraCode',`
            'SourceTree',`
            'keepass',`
            'cmdermini',`
            '7zip',`
            'ngrok.portable',`
            'winscp',`
            'putty',`
            'GoogleChrome',`
            'paint.net',`
            'rapidee',`
            'sharex',`
            'SwissFileKnife',`
            'sysinternals',`
            'rufus',
            'openvpn'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula