# ----------------------------------------------------------------------------------
# FILENAME: SOS-PKI-Logbuch.ps1
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
# Funktion Nahme : Get-HuptUserVonAdminUser
# Ferwendung     : Hauptbenutzer von Administrator user ERmitelne
# Parameter      : 
# Version        :  1.0
# Autor          : Hubert Inderwildi

function Get-HuptUserVonAdminUser
{
    <#
	.SYNOPSIS
    Huptbenuzer von Administrativen User 
	.DESCRIPTION
    Huptbenuzer von Administrativen User 
    .PARAMETER AdminUser 
	 Administraifer AD Benutzer (afd....   oer abs...)

    .EXAMPLE 
    PS C:\> Get-HuptUserVonAdminUser -AdminUser  afdihu
    .NOTES
       
   
	Author                                    : Hubert Inderwildi
	Version                                   : 0.1
	#>
    param
    (
        [Parameter(Mandatory=$true)][String]$AdminUser                       # Nhamen des Administratifen User ohne Domain
    )
     
    process
    {
             
        $red = "    "
        $AdminUser =  $AdminUser.ToLower()
        if (Test-ADUser $AdminUser )
        {
            if ($AdminUser  -match "afd" )
            {
                $HuptUser = $AdminUser.Replace("afd","tzd")
                if (Test-ADUser $HuptUser )
                {
                    $red = (Get-ADUser  $HuptUser).Name
                }

                
            }
            if ($AdminUser  -match "abs" )
            {
                $HuptUser = $AdminUser.Replace("abs","tzd")
                if (Test-ADUser $HuptUser )
                {
                    $red = (Get-ADUser  $HuptUser).Name
                }   
            }
        }
        Return $red
        
    }
   
   
}
#****************************************************************************************************************************************************************************
# Funktion Nahme : Get-MailAdressVonAdminUser
# Ferwendung     : Hauptbenutzer Emailadresse  von Administrator user ERmitelne
# Parameter      : 
# Version        :  1.0
# Autor          : Hubert Inderwildi

function Get-MailAdressVonAdminUser
{
    <#
	.SYNOPSIS
     Haupt Emailadresse von Administratifen Benutzer (afd abs )
	.DESCRIPTION
    Haupt Emailadresse von Administratifen Benutzer (afd abs )
	.DESCRIPTION
    .PARAMETER AdminUser 
	 Administraifer AD Benutzer (afd....   oer abs...)

    .EXAMPLE 
    PS C:\> Get-HuptUserVonAdminUser -AdminUser  afdihu
    .NOTES
       
   
	Author                                    : Hubert Inderwildi
	Version                                   : 0.1
	#>
    param
    (
        [Parameter(Mandatory=$true)][String]$AdminUser                       # Nhamen des Administratifen User ohne Domain
    )
     
    process
    {
             
        $red = " "
        $AdminUser =  $AdminUser.ToLower()
        if (Test-ADUser $AdminUser )
        {
            if ($AdminUser  -match "afd" )
            {
                $HuptUser = $AdminUser.Replace("afd","tzd")
                if (Test-ADUser $HuptUser )
                {
                    $red = (Get-ADUser  $HuptUser -Properties mail).mail
                }
                
            }
     
        }
        if ($AdminUser  -match "abs" )
        {
            $HuptUser = $AdminUser.Replace("abs","tzd")
            if (Test-ADUser $HuptUser )
            {
                $red = (Get-ADUser  $HuptUser -Properties mail).mail
                            }   
        }
        Return $red
        
    }
   
   
}
#****************************************************************************************************************************************************************************
# Funktion Nahme : Get-USERIstIntern
# Ferwendung     : Hauptbenutzer Emailadresse  von Administrator user ERmitelne
# Parameter      : 
# Version        :  1.0
# Autor          : Hubert Inderwildi
Function Get-USERIstIntern
{
    <#
	.SYNOPSIS
    Testen on ein AD Benutzer Intern oder Extern ist
	.DESCRIPTION
    Testen on ein AD Benutzer Intern oder Extern ist
    .PARAMETER UserNamen 
	 AD Benuzernahme ohne Domain  

    .EXAMPLE 
    PS C:\> Get-USERIstIntern  tzdihu 
    .NOTES
    $Tu
    
   
	Author                                    : Hubert Inderwildi
	Version                                   : 0.1
	#>
    param
    (
        [Parameter(Mandatory=$true)][String]$UserNamen                       # Nhame des zu Testnen Users
    )
    
    process
    {
        $red = $true
        if ((((Get-ADUser $UserNamen -Properties CanonicalName  ).CanonicalName  ) -match "Externe"))
        {
            $red = $false    
        }          
        else {
            $red = $true
        }
      
      
      
        Return $red
        
    }
      
}

