
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.IO;
using System.Runtime.InteropServices;

namespace MyFirstapi;

public class Program
{
    public static void Main(string[] args)
    {


        //Directory.SetCurrentDirectory(@"the directory of WebApi Project");
        //var options = new WebApplicationOptions();
        WebApplicationOptions webAppOptions = new WebApplicationOptions();// { EnvironmentName = "Development", ApplicationName = "WebApi" };
     
        var builder = WebApplication.CreateBuilder(webAppOptions);
        // Add services to the container.

        System.Environment.SetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", "Development", EnvironmentVariableTarget.Process);

        builder.Configuration.AddJsonFile("appsettings.json",
                optional: true,
                reloadOnChange: true);


        builder.Services.AddHttpsRedirection(opt => opt.HttpsPort = 443);
        builder.Services.AddControllers();
/*        builder.Services.AddControllers(options =>
        {
            options.Conventions.Add(new NonActionClassFilter());
        }); 
*/        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();
        }

        app.UseHttpsRedirection();

        app.UseAuthorization();


        app.MapControllers();

        app.Run();
    }

}