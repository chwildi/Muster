# ----------------------------------------------------------------------------------
# FILENAME:  ITBS-AD-MgmtImport-Module -Name  ActiveDirectory.psm1
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


# Import-Module -Name  ActiveDirectory -Force

$BasisPath = Split-Path $MyInvocation.MyCommand.Definition -Parent
#region Script execution
.  "$BasisPath\\Skript\AdGetUser.ps1"
.  "$BasisPath\\Skript\TestActiveDirectory.ps1"

#endregion

#region AdGetUser.ps1
# Export-ModuleMember 
Export-ModuleMember Get-HuptUserVonAdminUser
Export-ModuleMember Get-MailAdressVonAdminUser
Export-ModuleMember Get-USERIstIntern
#endregion
#region TestActiveDirectory.ps1
Export-ModuleMember Test-ADUser
Export-ModuleMember Test-ADGroup



#endregion
