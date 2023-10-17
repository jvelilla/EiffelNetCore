 partial class App

 	inherit APPLICATION
			redefine
				initialize,
				on_framework_initialization_completed
			end


feature

	initialize
		do
			{AVALONIA_XAML_LOADER}.load(Current)
		end

	on_framework_initialization_completed
		local
			l_main_window: MAIN_WINDOW
		do
			if attached {ICLASSIC_DESKTOP_STYLE_APPLICATION_LIFETIME} application_lifetime as desktop then

				create l_main_window
				l_main_window.set_data_context (create {MAIN_WINDOW_VIEW_MODEL})
				desktop.set_main_window (l_main_window)
			end

			on_framework_initialization_completed
		end

 end

--    {
--        public override void Initialize()
--        {
--            AvaloniaXamlLoader.Load(this);
--        }

--        public override void OnFrameworkInitializationCompleted()
--        {
--            if (ApplicationLifetime is IClassicDesktopStyleApplicationLifetime desktop)
--            {
--                desktop.MainWindow = new MainWindow
--                {
--                    DataContext = new MainWindowViewModel(),
--                };
--            }

--            base.OnFrameworkInitializationCompleted();
--        }
--    }
--}
