# ----------------------------------------------------------------------------------
# FILENAME: TestActiveDirectory.ps1
# TIMESTAMP: YES
# NOTIFY:    YES
# AUTHORS:   hubert.inderwildi@bs.ch
# PURPOSE:   Do something on somewhere at sometime
# COMMENT:   Any comment if needed.
# COPYRIGHT: (c) 2020  Finanzdepartement des Kantons Basel-Stadt
# ----------------------------------------------------------------------------------
# HISTORY:
# 2020-10-08 V2 Initial release.
# 
#
# ----------------------------------------------------------------------------------
# INITIALIZATION (set flags, libraries, modules)
# ---------------------------------------------------------------------------------


#****************************************************************************************************************************************************************************
# Funktion Nahme : TEST-ADUser
# Ferwendung     : Püfen ob ein Benuzer exisiert
# Parameter      : 
# Version        :  1.0
# Autor          : Hubert Inderwildi
function Test-ADUser {
    <#
	.SYNOPSIS
     Testen ob ein AD Benutzer Existiert
	.DESCRIPTION
    Testen ob ein AD Benutzer Existiert
    .PARAMETER CARequestID
    .PARAMETER UserName 
	AD Benuzernahmen für den Test

    .EXAMPLE 
    PS C:\> Test-ADUser -UserName  
    .NOTES
       
   
	Author                                    : Hubert Inderwildi
	Version                                   : 0.1
	#>
    param
    (
        [Parameter(Mandatory=$true)][String]$UserName                # Benuzernahmen zum Testen 
    )
           
    process
    {
        $red = $true
        try
        {
         Get-ADUser $UserName -ErrorAction  SilentlyContinue  
        }
        catch {
            $red = $false
        }
        

        Return  $red 
    }
    
}
#****************************************************************************************************************************************************************************
# Funktion Nahme : TEST-ADGroup 
# Ferwendung     : Püfen ob ein AS Gruppe Exisiert
# Parameter      : 
# Version        :  1.0
# Autor          : Hubert Inderwildi
function Test-ADGroup 
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)][String]$Gruppennamen                 # AD Gruppennamen zum Testen
    )
           
    process
    {
        $red = $true
        try
        {
            Get-ADGroup $Gruppennamen  -ErrorAction  SilentlyContinue 
        }
        catch {
            $red = $false
        }
        

        Return  $red 
    }
    
}

