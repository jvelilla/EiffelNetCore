using Avalonia;
using System.Reflection;
namespace AvaloniaAppBuilder;
public class AppBuilderFacade
{
    /// <summary>
    /// Builds and configures an instance of the AppBuilder class.
    /// </summary>
    /// <param name="entryPointType">The Type of the entry point for the application.</param>
    /// <returns>An instance of the AppBuilder class, configured with platform detection, logging, and ReactiveUI.</returns>
    /// <exception cref="InvalidOperationException">Thrown when the Configure method cannot be found.</exception>
    public static AppBuilder BuildAndConfigure(Type entryPointType)
    {
        var appBuilderType = typeof(AppBuilder);
        var configureMethod = appBuilderType.GetMethods(BindingFlags.NonPublic | BindingFlags.Static)
            .FirstOrDefault(m => m.Name == "Configure" && m.GetParameters().Length == 1 && m.GetParameters()[0].ParameterType == typeof(Type));

        if (configureMethod != null)
        {
            var appBuilder = (AppBuilder)configureMethod.Invoke(null, new object[] { entryPointType });

            return appBuilder.UsePlatformDetect();
        }
        else
        {
            throw new InvalidOperationException("Unable to find the Configure method.");
        }
    }
}