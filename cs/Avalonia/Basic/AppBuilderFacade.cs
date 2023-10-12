using Avalonia;
using Avalonia.ReactiveUI;
using BasicMvvmSample;

public class AppBuilderFacade
{
    public AppBuilder BuildAndConfigure()
    {
        // Need to create a Facade for AppBuilder.Configure<App>
        // But AppBuilder doesn't provide a public constructor or 
        // Factort method without using Generics.
        return AppBuilder.Configure<App>()
            .UsePlatformDetect()
            .LogToTrace()
            .UseReactiveUI();
    }
}