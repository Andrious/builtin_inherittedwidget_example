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

  /// Toggle the use of the built-in InheritedWidget
  void useInheritedWidget() {
    final useInherited = InheritController.useInherited;
    InheritController.useInherited = !useInherited;
    Prefs.setBool('inheritedWidget', InheritController.useInherited);
    // Home Page must be called to set this one up
    if (!InheritController.useInherited && !callHome) {
      callHomeWidget();
    }
    HomeController().setState(() {});
  }

  ///
  bool get useInherited => InheritController.useInherited;

  /// Toggle the recreation or not of the 'Inherited' State objects
  void recreateStateObjects() {
    final recreate = InheritController.newKey;
    InheritController.newKey = !recreate;
    Prefs.setBool('recreate', InheritController.newKey);
  }

  ///
  bool get recreateStates => InheritController.newKey;

  /// Toggle the rebuilding of the Home Page State object
  void callHomeWidget() {
    final callHome = InheritController.callHome;
    InheritController.callHome = !callHome;
    Prefs.setBool('callHome', InheritController.callHome);
  }

  ///
  bool get callHome => InheritController.callHome;

  /// Change the dark mode theme
  void darkMode() {
    _themeController.isDarkMode = !_themeController.isDarkMode;
    final darkMode = _themeController.setIfDarkMode() ?? _lightTheme;
    App.themeData = darkMode;
    App.setState(() {});
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

    InheritController.useInherited = Prefs.getBool('inheritedWidget', true);
    InheritController.callHome = Prefs.getBool('callHome', false);
    InheritController.newKey = Prefs.getBool('recreate', false);

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
  void pausedLifecycleState() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: pausedLifecycleState in $state');
    }
  }

  /// Called when app returns from the background
  @override
  void resumedLifecycleState() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: resumedLifecycleState in $state');
    }
  }

  /// If a State object is unexpectedly re-created
  /// You have to 'update' the properties of the new StateX object using the
  /// old StateX object because it's going to be disposed of.
  @override
  void updateNewStateX(oldState) {
    /// When a State object destroyed and a new one is re-created!
    /// This new StateX object may need to be updated with the old State object
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: updateNewStateX in $state');
    }
  }

  /// The application is in an inactive state and is not receiving user input.
  @override
  void inactiveLifecycleState() {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: inactiveLifecycleState in $state');
    }
  }

  /// Either be in the progress of attaching when the engine is first initializing
  /// or after the view being destroyed due to a Navigator pop.
  @override
  void detachedLifecycleState() {
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

  /// Called when the host tells the app to push a new route onto the
  /// navigator.
  @override
  Future<bool> didPushRoute(String route) async {
    if (inDebugMode) {
      //ignore: avoid_print
      print('############ Event: didPushRoute in $state');
    }
    return super.didPushRoute(route);
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
