﻿$UserName = @("Utilisateur1.Test", "Utilisateur2.Test", "Utilisateur3.Test")
$FilePath = '.\Utiliser les Parameter Sets\Utilisateurs.csv'

function New-MyADUser {
    [CmdletBinding(DefaultParameterSetName = "ByUserName")]
    param (
        [Parameter(ParameterSetName='ByUserName')]
        [System.String[]]$UserName,
        [Parameter(ParameterSetName = 'ByFileName')]
        [System.String]$FilePath
    )




}