using Avalonia;
using Avalonia.ReactiveUI;
using AvaloniaAppBuilder;
using System;

namespace BasicMvvmSample;

    public class Program
    {
        // Initialization code. Don't use any Avalonia, third-party APIs or any
        // SynchronizationContext-reliant code before AppMain is called: things aren't initialized
        // yet and stuff might break.
         [STAThread]
        public static void Main(string[] args)
        {
            AppBuilderFacade.BuildAndConfigure(typeof(App))
                   .LogToTrace()
                   .UseReactiveUI()
                   .StartWithClassicDesktopLifetime(args);
        }
}


