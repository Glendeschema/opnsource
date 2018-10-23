<#

This app will be used by our internal store to capture and render sales.

Run below 
 Install-Module SimplySql -Verbose -Force
#>



if(!(get-module SimplySql)){
    Write-Output "Module will be installed"
    Install-Module SimplySql -Verbose -Force
}
else {
    Write-Host "Module is already installed....."  -ForegroundColor Blue
}

#Creating SQL DB Connection to server


Open-SqlConnection `
-ConnectionName conn `
-Server "schema.database.windows.net" `
-Credential (Get-Credential -Message "Enter AzureSQL Login") `
-Database "schema" `
-Verbose

#Start of Application

Write-Host "Welcome to my Store...Please select the following options" -ForegroundColor blue
Write-Host ""
Write-Host "1-User Management - 2-stock inventory & Control 3-Creditors management 4-selling store" -ForegroundColor Blue

function User-Management {

     param (
        [string]$name ,
        [string]$surname ,
        [int]$option
    )


     Write-Host "1-create new user 2-update existing user 3-delete user"
    $option = read-host "Enter option"

    switch($option){

        1 {

            $name = read-host "Enter First Name"
            $surname = read-host "Enter Surname" 
            
            $result = Invoke-Sqlupdate -ConnectionName conn `
            -Query "INSERT INTO stores.users (Name,Surname) VALUES (@name , @surname)" -Parameters @{ name = $name ; surname =$surname}
            
            if($result){

                Invoke-Sqlquery -ConnectionName conn `
            -Query "SELECT * FROM stores.users"
            }

          }
          
        2 {

        

            Write-Host " "
               $uID = read-host "Enter User ID"
               $name = read-host "Enter New Name"
               $surname = read-host "Enter New Surname"

               $result = Invoke-Sqlupdate -ConnectionName conn `
               -Query "UPDATE stores.users 
               SET Name = @name
               Where uID = @uID" -Parameters @{name = $name ; uID=$uID}


               Invoke-Sqlupdate -ConnectionName conn `
               -Query "UPDATE stores.users 
               SET Surname = @surname
               Where uID = @uID" -Parameters @{surname = $surname ; uID=$uID}

               if($result){
                   Write-Output "Data successfully updated"
               }

               Close-SqlConnection -ConnectionName conn -Verbose



          } 



        }

        
   
   
}

