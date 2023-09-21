using Microsoft.AspNetCore.Mvc.ApplicationModels;
using Microsoft.Extensions.DependencyInjection;
using MyFirstapi;

namespace ASPNetUtil;
public static class CustomApplicationModelProviderFacade
{
    public static void Register(IServiceCollection services)
    {
        services.AddSingleton<IApplicationModelProvider, CustomApplicationModelProvider>();
    }
}