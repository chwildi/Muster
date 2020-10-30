# ----------------------------------------------------------------------------------
# FILENAME:  CA-Logbuch-CreateTabelle.ps1
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


function ADD-LogbuchTebel
{
    param (
        
    )
    
    begin {
        
    }
    
    process
    {
        $kattadtum = Get-Date 
        $LogbuchEntry = New-Object PSObject
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "LogbuchStatus"           -Value 0
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "CARequestID"             -Value 0
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Ausfuerung"              -Value $kattadtum
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Enddatum"                -Value $kattadtum
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "MagicTicket"             -Value "         "
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "RekuestUser"             -Value "         "
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "AntrastellerUser"        -Value "         " 
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Antragsteller"           -Value "         "
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Benarchritigunsmail"     -Value "         "
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Subject"                 -Value "         "
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "CAName"                  -Value "         "
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "CATemplate"              -Value "         "
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Revoziert"               -Value "         "
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "RevoziertVon"            -Value "         "
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "RevoziertDatum"          -Value "         "
        Add-Member -InputObject $LogbuchEntry  -MemberType NoteProperty -Name "Bemerkungen"             -Value "         "
        

        $LogbuchEntry | Write-SqlTableData  -ServerInstance "fdzid-svsql02.bs.ch" -DatabaseName "PKI-Logbuch" -SchemaName "dbo" -TableName "Logbuch"  -Force 
               




    }
    
    end {
        
    }
}
