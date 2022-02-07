<#
.Synopsis
   Script using choco for baseline software and configs for smooth sailings. 
.DESCRIPTION
   This script will install, configure & upate baseline software and configs.
.EXAMPLE
   ./windows.baseline.ps1 -install:$false -upgrade:$true -reconfigure:$true
.EXAMPLE
   ./windows.baseline.ps1
.INPUTS
   --install
   --reconfigure
   --update
.OUTPUTS
   ¯\_(ツ)_/¯
.NOTES
   General notes
.COMPONENT
   n/a
.ROLE
   n/a
.FUNCTIONALITY
   .check for and install choco
   .check for and install git
   .install and update software packages from $listOfMaslow
   .overwrite config files of packages from $listofMaslow with $minionsOfEdJenner
#>
[CmdletBinding()]
param (
    [Parameter()]
    [bool]
    $install = $false,
    [Parameter()]
    [bool]
    $update = $true, 
    [Parameter()]
    [bool]
    $reconfigure = $false
)
$olympus               = [PSCustomObject]@{
   software            = 'git,7zip,foxitreader,cherrytree,discord,greenshot,vscode,firefox,powertoys,spotify,telegram,vlc'
   configs             = $null
   Scbase              = 'https://raw.githubusercontent.com/myLinus/windows_baseline/main/'
}
$bookOfHubbard         = [PSCustomObject]@{
    chocoNotInstalled  = 'Choco is not installed. Will start installation of Choco#Done! Choco has been installed.'
    install            = 'Now installing:#Done!'
    update             = 'Now updating:#Done!'
    configure          = 'Now configuring:#Done!'
 }
 $configPaths          = New-Object 'System.Collections.Generic.Dictionary[String,String]'
    $configPaths.Add("firefox",'')
    $configPaths.Add("powershell",[string]$profile)
$lisftofMaslow = $olympus.software
        function baselineInstall {
if (!(choco -v)) {
    Write-host ([string]$bookOfHubbard.chocoNotInstalled).Split('#')[0]
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Clear-Host
    Write-host ([string]$bookOfHubbard.chocoNotInstalled).Split('#')[1]
}
    foreach ($physiologicalNeed in [array]$lisftofMaslow.Split(',')) {
        Write-host ([string]($bookOfHubbard.install).Split('#')[0]) ([string]$physiologicalNeed)
        choco install $physiologicalNeed --yes --no-progress --limitoutput --nocolor
        Write-host ([string]$bookOfHubbard.install).Split('#')[1]
        Clear-Host
        Write-Host 
    }
}
        function basselineUpdate {
    foreach ($securityAndSafetyNeed in [array]$lisftofMaslow.Split(',')) {
         Write-host ([string]($bookOfHubbard.install).Split('#')[0]) ([string]$securityAndSafetyNeed)
        choco update $securityAndSafetyNeed --yes --no-progress --limitoutput --nocolor
        Write-host ([string]$bookOfHubbard.install).Split('#')[1]
        }
}
    function baselineReconfigure {
        foreach ($key in $configPaths) {
            #Invoke-WebRequest -Uri ([string]$olympus.Scbase + )
            write-host $configPaths.($key)
        }
        
}

switch ($install) {
    $true  {baselineInstall}
    $false {}
}
switch ($update) {
    $true  {basselineUpdate}
    $false {}
}
switch ($reconfigure) {
    $true  {baselineReconfigure}
    $false {}
}