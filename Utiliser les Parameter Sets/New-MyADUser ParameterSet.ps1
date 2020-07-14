﻿$UserName = @("Utilisateur1.Test", "Utilisateur2.Test", "Utilisateur3.Test")
$FileName = '.\Utiliser les Parameter Sets\Utilisateurs.csv'

function New-MyADUser {
    [CmdletBinding(DefaultParameterSetName = "ByUserName")]
    param (
        [Parameter(ParameterSetName='ByUserName')]
        [System.String[]]$UserName,
        [Parameter(ParameterSetName = 'ByFileName')]
        [System.IO.DirectoryInfo]$FileName
    )

    switch ($PSCmdlet.ParameterSetName) {
        "ByUserName" {
            $PSCmdlet.ParameterSetName
            foreach ($User in $UserName) {
                New-ADUser -name $User -GivenName ($User.Split(".")[0]) -Surname ($User.Split(".")[1]) -Server srv-ad101 -Credential $CredAdmin
            }
         }
        "ByFileName" {
            $PSCmdlet.ParameterSetName
            $UserName = Import-Csv -Path $FileName
            foreach ($User in $UserName) {
                New-ADUser -name $User.UserName -GivenName ($User.UserName.Split(".")[0]) -Surname ($User.UserName.Split(".")[1]) -Server srv-ad101 -Credential $CredAdmin
            }
         }
    }
}