# Building Web APIs with .Net using Eiffel

* Provide data to different clients
* Uniform contract

# Net 
* using .Net 7
* Eiffel

# Web
    * HTTP 
    * ASP.Net Core 7, 6

## Getting Started

* EiffelStudio 23.08 
* Postman or Hoppscotch for testing APIs
* .Net 7

## Create our first Web API 
    *  Copy the project template net7
    *  Rename it as my_first_api 
        * my_first_api.ecf
        
##  Add the following packages

Microsoft.AspNetCore.OpenApi  version 7.0.10
Swashbuckle.AspNetCore        version 6.5.0 


dotnet add package Swashbuckle.AspNetCore --version 6.5.0 --package-directory packages

dotnet add package Microsoft.AspNetCore.OpenApi --version 7.0.10 --package-directory packages