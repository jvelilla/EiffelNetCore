
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
        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
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
        //System.Diagnostics.Process.Start("https://localhost:5555");
    }

/*    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // Add services to the container
        var services = builder.Services;

        MvcServiceCollectionExtensions.AddControllers(services);
        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        EndpointMetadataApiExplorerServiceCollectionExtensions.AddEndpointsApiExplorer(services);
        //SwaggerGenServiceCollectionExtensions.AddSwaggerGen(Services).DoNothing;
        // Adding swagger raise a null pointer exceptions

        var app = builder.Build();

        *//*// Configure the HTTP request pipeline.
        if (HostingEnvironment.App.Environment != null && HostEnvironmentEnvExtensions.IsDevelopment(App.Environment))
        {
            Console.WriteLine("Configure Request Pipeline");
        }
        *//*
        HttpsPolicyBuilderExtensions.UseHttpsRedirection(app);

        AuthorizationAppBuilderExtensions.UseAuthorization(app);
        ControllerEndpointRouteBuilderExtensions.MapControllers(app);

        app.Run();
    }*/
}