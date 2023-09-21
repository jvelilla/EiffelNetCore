using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Xml.Linq;

namespace MyFirstapi.Controllers;

[ApiController]
[Route("[controller]")]
public class WeatherForecastController : Controller { 


    private static readonly string[] Summaries = new[]
    {
    "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"};

    private readonly ILogger<WeatherForecastController> _logger;

    public WeatherForecastController(ILogger<WeatherForecastController> logger)
    {
        _logger = logger;
    }

    //[HttpGet(Name = "GetWeatherForecast")]
    [HttpGet]
    public IEnumerable<WeatherForecast> Get()
    {
        return Enumerable.Range(1, 5).Select(index => new WeatherForecast
        {
            Date = DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
            TemperatureC = Random.Shared.Next(-20, 55),
            Summary = Summaries[Random.Shared.Next(Summaries.Length)]
        })
        .ToArray();
    }

    /*   public IEnumerable<WeatherForecast> GetTest()
       {
           return Enumerable.Range(1, 5).Select(index => new WeatherForecast
           {
               Date = DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
               TemperatureC = Random.Shared.Next(-20, 55),
               Summary = Summaries[Random.Shared.Next(Summaries.Length)]
           })
           .ToArray();
       }*/

    public override void OnActionExecuting(ActionExecutingContext context)
    {
        var nonActionAttr = (NonActionClassAttribute)context.Controller.GetType().GetCustomAttribute(typeof(NonActionClassAttribute));
        if (nonActionAttr != null && nonActionAttr.MethodsToExclude.Contains(context.ActionDescriptor.DisplayName))
        {
            context.Result = new NotFoundResult(); // Or some other result to indicate the method was not found
        }
        else
        {
            base.OnActionExecuting(context);
        }
    }
}