# ----------------------------------------------------------------------------------
# FILENAME:  CA-Logbuch.ps1
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
function ADD-CALogbuchEntry
{
    <#
	.SYNOPSIS
	Diese Funktion Erstellet einen nunen Logbuch eintrag
	.DESCRIPTION
    Diese Funktion Erstellet einen nunen Logbuch eintrag
    .PARAMETER Mode 
	 Mudus für den Logbucheintrag "ADD-Rekuest","ADD-Revozier","ADD-AutoRekuest","ADD-AutoRevoziert"
    .PARAMETER CARequestID
	Rekuest ID der Zerifizirungstelle 
	.PARAMETER Revoziert
	Wird  das Zerifikat Revoziert  $ture 
	.PARAMETER Antragsteller
	Email Adresse des Antragstellers  
	.PARAMETER Benarchritigunsmail
    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    .PARAMETER Bemerkungen
    xxxxxxxxxxxxxxxxxxxxxxxxxxx
    .PARAMETER MagicTicket
    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   .PARAMETER MagicTicket
    PARAMETER


    .EXAMPLE 
    PS C:\> 
	.EXAMPLE 
	PS C:\> 
    .NOTES
    
    .EXAMPLE
	
	.EXAMPLE 
	
	.NOTES
	Author                                    : Hubert Inderwildi
	Version                                   : 0.1
	#>

   
    param (
        
        [Parameter(Mandatory=$true)] [ValidateSet("ADD-Rekuest","ADD-Revozier","ADD-AutoRekuest","ADD-AutoRevoziert")][String]$Mode
        



        [Parameter(Mandatory=$true)][INT]$CARequestID,                                    
        [Parameter(Mandatory=({$Mode -match "ADD-Auto"})][String]$Antragsteller,
        [Parameter(Mandatory=$false)][String]$Benarchritigunsmail,
        [Parameter(Mandatory=$false)][String]$Bemerkungen,
        [Parameter(Mandatory=$false)][String]$MagicTicket,
        [Parameter(Mandatory=$false)]$Ausfuerung, 
        [Parameter(Mandatory=$false)]$Enddatum
        




    )
       
   


    process
    {
        switch ($Mode)
        {
            "ADD-Rekuest"                                  
            {
                $LogbuchStatus        = 11
                $RequestOBJ           = Get-IssuedRequest -RequestID  $CARequestID  -CertificationAuthority (Get-CertificationAuthority)
                $RekuestADUserFull    = $RequestOBJ.'Request.RequesterName'
                $RekuestADUser        = $RekuestADUserFull.Split("\")[1]
                $RequestOID           = $RequestOBJ.CertificateTemplate
                $CATemplate           = (Get-CertificateTemplate -OID  $RequestOID ).Name
                $Ausfuerung           = $RequestOBJ.NotBefore
                $Enddatum             = $RequestOBJ.NotAfter
                $Subject              = $RequestOBJ.CommonName
                $CAName               = ($RequestOBJ.ConfigString).Split("\")[1]
                $Antragsteller        = Get-MailAdressVonAdminUser $RekuestADUser
                $SerialNumber         = $RequestOBJ.SerialNumber 





             }
             "ADD-Revozier"             
             {
                $LogbuchStatus        = 31
                $RequestOBJ           = Get-IssuedRequest -RequestID  $CARequestID  -CertificationAuthority (Get-CertificationAuthority)
                $RekuestADUserFull    = $RequestOBJ.'Request.RequesterName'
                $RekuestADUser        = $RekuestADUserFull.Split("\")[1]
                $RequestOID           = $RequestOBJ.CertificateTemplate
                $CATemplate           = (Get-CertificateTemplate -OID  $RequestOID ).Name
                $Ausfuerung           = $RequestOBJ.NotBefore
                $Enddatum             = $RequestOBJ.NotAfter
                $Subject              = $RequestOBJ.CommonName
                $CAName               = ($RequestOBJ.ConfigString).Split("\")[1]
                $SerialNumber         = $RequestOBJ.SerialNumber 


             }
             "ADD-AutoRevoziert"                           # Zerifikat Revoke aus Import
             {
                $LogbuchStatus        = 32
                $RequestOBJ           = Get-RevokedRequest -RequestID $CARequestID  -CertificationAuthority (Get-CertificationAuthority)
                $RevokedDatum         = $RequestOBJ.'Request.RevokedWhen'  
                $CATemplate           = (Get-CertificateTemplate -OID  $RequestOID ).Name
                $Subject              = $RequestOBJ.CommonName
                $CAName               = ($RequestOBJ.ConfigString).Split("\")[1]
                $SerialNumber         = $RequestOBJ.SerialNumber 


             }
   


        
             "ADD-AutoRekuest"                                                                      # Logbuch eintag für Aumtomatsch Generirtes Zerifikat 
            {
                $LogbuchStatus        = 13
                $RequestOBJ           = Get-IssuedRequest -RequestID  $CARequestID  -CertificationAuthority (Get-CertificationAuthority)
                $RekuestADUserFull    = $RequestOBJ.'Request.RequesterName'
                $RekuestADUser        = $RekuestADUserFull.Split("\")[1]
                $AntrastellerUser     = $RekuestADUserFull
                $RequestOID           = $RequestOBJ.CertificateTemplate
                $CATemplate           = (Get-CertificateTemplate -OID  $RequestOID ).Name
                $Ausfuerung           = $RequestOBJ.NotBefore
                $Enddatum             = $RequestOBJ.NotAfter
                $Subject              = $RequestOBJ.CommonName
                $CAName               = ($RequestOBJ.ConfigString).Split("\")[1]
                $Antragsteller        = Get-MailAdressVonAdminUser $RekuestADUser
                $SerialNumber         = $RequestOBJ.SerialNumber 
               

            }

        }

    





        $LogbuchEntry = New-Object PSObject
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "LogbuchStatus"           -Value $LogbuchStatus 
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "CARequestID"             -Value $CARequestID
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Ausfuerung"              -Value $Ausfuerung
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Enddatum"                -Value $Enddatum
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "MagicTicket"             -Value $MagicTicket
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "RekuestUser"             -Value $RekuestADUserFull
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "AntrastellerUser"        -Value $AntrastellerUser
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Antragsteller"           -Value $Antragsteller
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Benarchritigunsmail"     -Value $Benarchritigunsmail
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Subject"                 -Value $Subject
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "CAName"                  -Value $CAName
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "CATemplate"              -Value $CATemplate
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Revoziert"               -Value $Revoziert
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "RevoziertVon"            -Value $RevoziertVon
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "RevoziertDatum"          -Value $RevokedDatum
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Bemerkungen"             -Value $Bemerkungen
               
        
       
        $LogbuchEntry | Write-SqlTableData  -ServerInstance "fdzid-svsql02.bs.ch" -DatabaseName "PKI-Logbuch" -SchemaName "dbo" -TableName "Logbuch"  
       
       
    
  




    }
   
   
}

