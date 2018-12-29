# Description: Boxstarter Script  
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

#--- Visual Studio ---
choco install visualstudio2017professional -y --package-parameters "--add Microsoft.VisualStudio.Component.Git" 
Update-SessionEnvironment #refreshing env due to Git install

choco install -y visualstudio2017-workload-manageddesktop
choco install -y visualstudio2017-workload-netcoretools
choco install -y visualstudio2017-workload-azure 
choco install -y visualstudio2017-workload-visualstudioextension 

#--- Define Packages to Install ---
$Packages = 'git',`
            'poshgit',`
            'kdiff3',`
            'resharper-ultimate-all /NoCpp',`
            'vscode',`
            'notepadplusplus',`
            'nodejs',`
            'FiraCode',`
            'SourceTree',`
            'snoop',`
            'fiddler',`
            'keepass',`
            'cmdermini',`
            '7zip',`
            'ngrok.portable',`
            'winscp',`
            'GoogleChrome',`
            'paint.net',`
            'rapidee',`
            'sharex',`
            'SwissFileKnife',`
            'sysinternals',`
            'windirstat',`
            'rufus',`
            'openvpn'

#--- Install Packages ---
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
