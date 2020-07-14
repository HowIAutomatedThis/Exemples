﻿$UserName = @("Utilisateur1.Test","Utilisateur2.Test","Utilisateur3.Test")

function New-MyADUser {
    param (
        [System.String[]]$UserName
    )

    foreach($User in $UserName) {
        New-ADUser -name $User -GivenName ($User.Split(".")[0]) -Surname ($User.Split(".")[1])
    }

}

New-MyADUser -UserName $UserName