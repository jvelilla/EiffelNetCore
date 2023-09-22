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
    * Set the environment variable
    `set ASP_NET_CORE=C:\Program Files\dotnet\shared\Microsoft.AspNetCore.App\7.0.10`
        
        
The default formatter in ASP.Net core for JSON is System.Text.Json if we want to use
NewtonSoft.Json we need to add the dependency. More about Format response data in ASP.NET Core Web API
in the following [link](https://learn.microsoft.com/en-us/aspnet/core/web-api/advanced/formatting?view=aspnetcore-7.0)
        
##  Add the following packages

Microsoft.AspNetCore.OpenApi  version 7.0.10
Swashbuckle.AspNetCore        version 6.5.0 
Microsoft.AspNetCore.Mvc.NewtonsoftJson version 7.0.11

dotnet add package Swashbuckle.AspNetCore --version 6.5.0 --package-directory packages

dotnet add package Microsoft.AspNetCore.OpenApi --version 7.0.10 --package-directory packages

dotnet add package Microsoft.AspNetCore.Mvc.NewtonsoftJson --version 7.0.11 --package-directory packages