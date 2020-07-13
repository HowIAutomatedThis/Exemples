﻿$FilePath = '.\Utiliser les Parameter Sets\Utilisateurs.csv'
function New-MyADUser {
    param (
        [System.String]$FilePath
    )

    $UserName = Import-Csv -Path $FilePath

    foreach ($User in $UserName) {
        New-ADUser -name $User.UserName -GivenName ($User.UserName.Split(".")[0]) -Surname ($User.UserName.Split(".")[1]) -Server srv-ad101 -Credential $CredAdmin
    }

}

New-MyADUser -FilePath $FilePath