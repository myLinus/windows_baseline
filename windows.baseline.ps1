<#
.Synopsis
   Baseline software and configs for smooth sailings. 
.DESCRIPTION
   This script will install, configure & upate baseline software and configs.
.EXAMPLE
   ./windows.baseline.ps1 --install --update
.EXAMPLE
   ./windows.baseline.ps1 --reconfigure
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
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

$gitprofile = [PSCustomObject]@{
   username     = 'Kevin'
   Language = 'PowerShell'
   State    = 'Texas'
}

$olympus = [PSCustomObject]@{
   software     = 'git'
   configs = 'PowerShell'
   Scbase    = 'Texas'
} 3z2hoGkNvQ7zrb