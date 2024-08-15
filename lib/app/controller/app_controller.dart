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

  /// Assign to the 'leading' widget on the interface.
  void leading() => changeUI();

  /// Switch to the other User Interface.
  void changeUI() {
    //
    Navigator.popUntil(App.context!, ModalRoute.withName('/'));

    // This has to be called first.
    App.changeUI(App.useMaterial ? 'Cupertino' : 'Material');

    bool switchUI;
    if (App.useMaterial) {
      if (UniversalPlatform.isAndroid) {
        switchUI = false;
      } else {
        switchUI = true;
      }
    } else {
      if (UniversalPlatform.isAndroid) {
        switchUI = true;
      } else {
        switchUI = false;
      }
    }
    Prefs.setBool('switchUI', switchUI);
  }

  ///
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

  // /// Retrieve the app's own controller.
  // TemplateController get appController =>
  //     _appController ??= App.vw!.con as TemplateController;
  // TemplateController? _appController;

  /// Supply the app's popupmenu
  /// an immutable menu
  Widget get menu => AppPopupMenu(
        key: const Key('appMenuButton'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        position: PopupMenuPosition.under,
        menuEntries: [
          PopupMenuItem(
            key: const Key('interfaceMenuItem'),
            value: 'interface',
            child: Text(
                '${'Interface:'.tr} ${App.useMaterial ? 'Material' : 'Cupertino'}'),
          ),
          PopupMenuItem(
            key: const Key('localeMenuItem'),
            value: 'locale',
            child: Text('${'Locale:'.tr} ${App.locale!.toLanguageTag()}'),
          ),
          if (App.useMaterial)
            PopupMenuItem(
              key: const Key('colorMenuItem'),
              value: 'color',
              child: L10n.t('Colour Theme'),
            ),
          PopupMenuItem(
            key: const Key('aboutMenuItem'),
            value: 'about',
            child: L10n.t('About'),
          ),
        ],
        inSelected: (String value) async {
          switch (value) {
            case 'interface':
              changeUI();
              break;
            case 'about':
              aboutApp();
              break;
            default:
          }
        },
      );

  /// **************  Life cycle events ****************

  /// Called to complete any asynchronous operations.
  @override
  Future<bool> initAsync() async {
    final init = await super.initAsync();
    //
    if (ExampleAppController().allowErrors) {
      throw Exception('error thrown in template_controller in $state');
    }
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
    // Clear itself? Would that be advisable?
    _this = null;

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
