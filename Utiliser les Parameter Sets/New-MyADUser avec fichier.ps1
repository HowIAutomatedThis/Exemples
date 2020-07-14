﻿$FileName = '.\Utiliser les Parameter Sets\Utilisateurs.csv'
function New-MyADUser {
    param (
        [System.IO.DirectoryInfo]$FileName
    )

    $UserName = Import-Csv -Path $FileName

    foreach ($User in $UserName) {
        New-ADUser -name $User.UserName -GivenName ($User.UserName.Split(".")[0]) -Surname ($User.UserName.Split(".")[1])
    }

}

New-MyADUser -FilePath $FileName