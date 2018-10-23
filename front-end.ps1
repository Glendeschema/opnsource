<#

This app will be used by our internal store to capture and render sales.

Run below 
 Install-Module SimplySql -Verbose -Force
<<<<<<< HEAD

 if(!(get-module SimplySql)){
    Write-Output "Module will be installed"
    Install-Module SimplySql -Verbose -Force -Scope CurrentUser
    Pause
=======
#>



if(!(get-module SimplySql)){
    Write-Output "Module will be installed"
    Install-Module SimplySql -Verbose -Force
>>>>>>> e0b52b7fe7ede943530accb5bcb974d81469e391
}
else {
    Write-Host "Module is already installed....."  -ForegroundColor Blue
}
<<<<<<< HEAD
#>


$result = Import-Module SimplySql
if (!$result){

    if(!(get-module SimplySql)){
        Write-Output "Module will be installed"
        Install-Module SimplySql -Verbose -Force -Scope CurrentUser
        Pause
    }
    else {
        Write-Host "Module is already installed....."  -ForegroundColor Blue
    }

}


=======
>>>>>>> e0b52b7fe7ede943530accb5bcb974d81469e391

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

<<<<<<< HEAD
$option =Read-Host "enter option"

=======
>>>>>>> e0b52b7fe7ede943530accb5bcb974d81469e391
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
<<<<<<< HEAD
            
=======

>>>>>>> e0b52b7fe7ede943530accb5bcb974d81469e391
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

             



          } 

          3 {
            $conn
            $uID = Read-host "Enter user ID you want to Delete"

            $result = Invoke-Sqlupdate -ConnectionName conn `
            -Query "DELETE FROM stores.users WHERE uID = @uID" -Parameters @{uID= $uID} 

            if($result){
                Write-Output "User successfuly deleted"
            }

          }



        }

        
   
   
}

function stock-inventory {
    param (
        [string]$itemid ,
        [string]$itemname ,
        [int]$qty ,
        [float]$price,
        [int]$option
    )

    Write-Output "1 -Create new item 2-add quantity to item 3-update item 4-remove item"

    $option = read-host "Enter option number"

    switch ($option){

        1 {

            $conn

            $itemname = Read-host "Enter Item Name"
            $itemid = Read-host "Enter Item code"
            $price = Read-host "Enter Item Price"  

            $result = Invoke-SqlUpdate -ConnectionName conn `
            -Query "INSERT INTO stores.Products (pID,ItemName,Price) VALUES (@itemid , @ItemName , @price)" `
            -Parameters @{itemid = $itemid ; ItemName = $itemname ; price = $price}

            if($result){
                Write-Output "Item succesfully inserted "

            }

         
          }

        2{
            $conn

                $itemid = Read-host "Enter Item ID"
                $qty = Read-host "Enter QTY"


                $result = Invoke-SqlUpdate -ConnectionName conn `
                -Query "INSERT INTO stores.Quantity (pID,QTY) VALUES (@pID,@qty)" -Parameters @{pID = $itemid ;qty=$qty }

                if($result){

                    write-output "Item Quantity successfully addded"
                }
         }

        3{

         }

         4 {

         }

    }


    
}

switch ($option){

    1 {

        User-Management #Function call
       
        pause
        clear
    }

    2{
        stock-inventory #Function call
       
        pause
        clear
    }
}
