//
import '/src/controller.dart';

/// You can see 'at a glance' this Controller also 'talks to' the interface (View).
import '/src/view.dart';

///
class ExampleAppController extends AppController {
  ///
  factory ExampleAppController() => _this ??= ExampleAppController._();
  ExampleAppController._()
      : _themeController = ThemeController(),
        super();

  static ExampleAppController? _this;

  final ThemeController _themeController;

  /// Run a StateX object's initAsync()
  /// Referenced in the StateX object's runInitAsync() function
  bool runInitAsync = true;

  /// Store the boolean allowing for errors or not.
  bool allowErrors = false;

  /// Error right at the start
  bool errorAtStartup = false;

  /// Dark Mode
  bool get inDarkMode => _themeController.isDarkMode;

  /// Initialize
  @override
  void initState() {
    super.initState();
    _lightTheme = App.themeData!;
    final darkMode = _themeController.setIfDarkMode();
    App.themeData = darkMode;
  }

  /// Record the current theme
  late ThemeData _lightTheme;

  /// Run the Future again
  bool get runFuture => _runFuture;
  bool _runFuture = false;

  /// Toggle the running of the State object's Future again and again
  void runAsync() {
    _runFuture = !_runFuture;
    Prefs.setBool('runFuture', _runFuture);
    HomeController().setState(() {});
  }

  /// Have the StateX objects use their built-in InheritedWidgets
  bool get useInherited => _useInherited;
  bool _useInherited = false;

  /// Toggle the use of the built-in InheritedWidget
  void useInheritedWidget() {
    _useInherited = !_useInherited;
    Prefs.setBool('inheritedWidget', _useInherited);
    HomeController().setState(() {});
  }

  /// Change the dark mode theme
  void darkMode() {
    _themeController.isDarkMode = !_themeController.isDarkMode;
    final darkMode = _themeController.setIfDarkMode() ?? _lightTheme;
    App.themeData = darkMode;
    // Rebuild the whole app
    App.setState(() {});
    // Don't cause the images to change
    runInitAsync = false;
  }

  ///
  void aboutApp() => showAboutDialog(
        context: App.context!,
        applicationName: App.appState?.title ?? '',
        applicationVersion: 'version: ${App.version} build: ${App.buildNumber}',
      );

  /// **************  Life cycle events ****************

  /// Called to complete any asynchronous operations.
  /// Initialize any 'time-consuming' operations at the beginning.
  /// Initialize asynchronous items essential to the applications.
  /// Called by a FutureBuilder() widget.
  @override
  Future<bool> initAsync() async {
    //
    var init = await super.initAsync();
    //
    if (allowErrors) {
      throw Exception('error thrown in controller in $state');
    }

    // The StatefulWidget
    final widget = rootState!.widget as ExampleApp;

    // Was a Splash Screen specified?
    if (widget.splashScreen != null || widget.inSplashScreen != null) {
      /// Simply wait for the Splash Screen to appear for a time at startup.
      /// In production, this is where databases are opened, logins attempted, etc.
      init = await Future<bool>.delayed(const Duration(seconds: 10), () {
        return true;
      });
    }

    _runFuture = Prefs.getBool('runFuture', true);
    _useInherited = Prefs.getBool('inheritedWidget', true);
    return init;
  }

  /// The framework calls this method when the [StateX] object removed from widget tree.
  /// i.e. The screen is closed.
  @override
  void deactivate() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: deactivate in $state');
    }
  }

  /// Called when this State object was removed from widget tree for some reason
  /// Undo what was done when [deactivate] was called.
  @override
  void activate() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: activate in $state');
    }
  }

  /// The framework calls this method when this [StateX] object will never
  /// build again.
  /// Note: YOU DON'T KNOW WHEN THIS WILL RUN in the Framework.
  /// PERFORM ANY TIME-CRITICAL OPERATION IN deactivate() INSTEAD!
  @override
  void dispose() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ now disposed.');
    }
    super.dispose();
  }

  /// The application is not currently visible to the user, not responding to
  /// user input, and running in the background.
  @override
  void pausedAppLifecycleState() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: pausedLifecycleState in $state');
    }
  }

  /// Called when app returns from the background
  @override
  void resumedAppLifecycleState() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: resumedLifecycleState in $state');
    }
  }

  /// The application is in an inactive state and is not receiving user input.
  @override
  void inactiveAppLifecycleState() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: inactiveLifecycleState in $state');
    }
  }

  /// Either be in the progress of attaching when the engine is first initializing
  /// or after the view being destroyed due to a Navigator pop.
  @override
  void detachedAppLifecycleState() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: detachedLifecycleState in $state');
    }
  }

  /// Override this method to respond when the [StatefulWidget] is recreated.
  @override
  void didUpdateWidget(StatefulWidget oldWidget) {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: didUpdateWidget in $state');
    }
  }

  /// Called when this [StateX] object is first created immediately after [initState].
  /// Otherwise called only if this [State] object's Widget
  /// is a dependency of [InheritedWidget].
  @override
  void didChangeDependencies() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: didChangeDependencies in $state');
    }
  }

  /// Called whenever the application is reassembled during debugging, for
  /// example during hot reload.
  @override
  void reassemble() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: reassemble in $state');
    }
  }

  /// Called when the system tells the app to pop the current route.
  /// For example, on Android, this is called when the user presses
  /// the back button.
  @override
  Future<bool> didPopRoute() async {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: didPopRoute in $state');
    }
    return super.didPopRoute();
  }

  /// Called when the host tells the application to push a new
  /// [RouteInformation] and a restoration state onto the router.
  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: didPushRouteInformation in $state');
    }
    return super.didPushRouteInformation(routeInformation);
  }

  /// Called when the application's dimensions change. For example,
  /// when a phone is rotated.
  @override
  void didChangeMetrics() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: didChangeMetrics in $state');
    }
  }

  /// Called when the platform's text scale factor changes.
  @override
  void didChangeTextScaleFactor() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: didChangeTextScaleFactor in $state');
    }
  }

  /// Brightness changed.
  @override
  void didChangePlatformBrightness() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: didChangePlatformBrightness in $state');
    }
  }

  /// Called when the system tells the app that the user's locale has changed.
  @override
  void didChangeLocales(List<Locale>? locales) {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: didChangeLocale in $state');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// Passing these possible values:
    /// AppLifecycleState.inactive (may be paused at any time)
    /// AppLifecycleState.paused (may enter the suspending state at any time)
    /// AppLifecycleState.detach
    /// AppLifecycleState.resume
    if (inDebugMode) {
      //ignore: avoid_print
      print(
          '############ Event: didChangeAppLifecycleState in ${this.state} for $this');
    }
  }

  /// Called when the system is running low on memory.
  @override
  void didHaveMemoryPressure() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: didHaveMemoryPressure in $state');
    }
  }

  /// Called when the system changes the set of active accessibility features.
  @override
  void didChangeAccessibilityFeatures() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: didChangeAccessibilityFeatures in $state');
    }
  }
}
