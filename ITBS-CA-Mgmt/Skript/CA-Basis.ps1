# ----------------------------------------------------------------------------------
# FILENAME: SOS-PKI-Basis.ps1
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
# Funktion Nahme : Create-SSLZertifikaVonTeplate
# Ferwendung     : Ertellen eines SSL Zerivikat von Teplate
# Parameter      :  
# Version        :  1.0
# Autor          : Hubert Inderwildi
function NEW-SSLZertifikaVonTeplate 

{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)][String]$Antragsteller,
        [Parameter(Mandatory=$true)][String]$Benarchritigunsmail,
        [Parameter(Mandatory=$true)][String]$Subject,
        [Parameter(Mandatory=$true)][String]$CAName,
        [Parameter(Mandatory=$true)][INT]$CARequestID,
        [Parameter(Mandatory=$true)][String]$CATemplate,
        [Parameter(Mandatory=$false)][String]$Bemerkungen,
        [Parameter(Mandatory=$false)][Boolean]$PFX,
        [Parameter(Mandatory=$false)][Boolean]$Revoziert,
        [Parameter(Mandatory=$false)][INT]$MagicTicket
    )
       
    
    
    process
    {



        $AktREkuest   = Submit-CertificateRequest -Path $aktfilemitPtha -CertificationAuthority (Get-CertificationAuthority)  -Attribute "CertificateTemplate:PKIBSvSphere7Server2K" -Verbose

        
    }
   
   
}

#****************************************************************************************************************************************************************************
# Funktion Nahme : Create-SSLZertifikat
# Ferwendung     : Ertellen eines SSL Zerivikat von Teplate
# Parameter      :  
# Version        :  1.0
# Autor          : Hubert Inderwildi
function Create-SSLZertifikat
{
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        
    }
    
    process {
    $AlleCATamplates    = Get-CertificateTemplate   | Out-GridView -Title "Bitte Templae auswählen" -PassThru 
    $AlleCATamplates 





    }
    
    end {
        
    }
}