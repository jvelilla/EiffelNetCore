using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
namespace ASPNetUtil;

public class HttpsRedirectionFacade
{
    
    public static void AddHttpsRedirectionWithSpecificOptions(IServiceCollection services, int port)
    {
         HttpsRedirectionServicesExtensions.AddHttpsRedirection(services, options =>
                {
                    options.HttpsPort = port;
                });
    }
}