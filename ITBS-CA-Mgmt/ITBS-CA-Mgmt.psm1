# ----------------------------------------------------------------------------------
# FILENAME: SOS-PKI.psm1
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
# Import-Module -Name M:\SQLServer\SqlServer.psm1 -Force
# Import-Module -Name PSPKI -Force
# Import-Module -Name M:\BSIT-AD-IMA\BSIT-AD-IMA.psm1 -Force

$BasisPath = Split-Path $MyInvocation.MyCommand.Definition -Parent
#region Script execution
.  "$BasisPath\Skript\CA-Basis.ps1"
.  "$BasisPath\Skript\CA-Logbuch.ps1"
.  "$BasisPath\Skript\CA-Logbuch-CreateTabelle.ps1"
.  "$BasisPath\Skript\CA-Logbuch-Imoprt-Old.ps1"
.  "$BasisPath\Skript\CA-Notification-Mail.ps1"
#endregion

#region SOS-PKI-Basis.ps1
# Export-ModuleMember 
Export-ModuleMember NEW-SSLZertifikaVonTeplate

#endregion
#region SOS-PKI-Logbuch
Export-ModuleMember ADD-CALogbuchEntry
#endregion

#region CA-Logbuch-CreateTabelle.ps1
Export-ModuleMember ADD-LogbuchTebel
#endregion
#region CA-Logbuch-Imoprt-Old.ps1
Export-ModuleMember Import-LogbuchVonCsv
#endregion
#region CA-Notification-Mail.ps1
Export-ModuleMember NEW-CANotificationMail
#endregion