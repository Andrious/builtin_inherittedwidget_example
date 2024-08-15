//
import '/src/controller.dart';

import '/src/view.dart';

/// The App's menu
class AppMenu extends AppPopupMenu {
  /// Only one instance of the class
  factory AppMenu() => _this ??= AppMenu._();

  ///
  AppMenu._()
      : _con = ExampleAppController(),
        super(
          key: const Key('appMenuButton'),
          controller: AppMenuController(),
        );
  static AppMenu? _this;

  /// The App's controller
  final ExampleAppController _con;

  /// Supply the app's popupmenu
  /// a mutable menu
  /// Supply the menu options
  @override
  List<PopupMenuEntry<String>>? onMenuEntries() => [
        PopupMenuItem(
          key: const Key('interfaceMenuItem'),
          value: 'interface',
          child: Text(
              '${'Interface:'.tr} ${App.useMaterial ? 'Material' : 'Cupertino'}'),
        ),
        if (App.useMaterial)
          PopupMenuItem(
            key: const Key('darkModeItem'),
            value: 'darkMode',
            child: Text('Dark Mode'.tr),
          ),
        PopupMenuItem(
          key: const Key('localeMenuItem'),
          value: 'locale',
          child: Text('${'Locale:'.tr} ${App.locale!.toLanguageTag()}'),
        ),
        PopupMenuItem(
          key: const Key('aboutMenuItem'),
          value: 'about',
          child: Text('About'.tr),
        ),
      ];

  /// When an menu item is selected
  @override
  Future<void> onSelected(String value) async {
    switch (value) {
      case 'interface':
        _con.changeUI();
        break;
      case 'darkMode':
        _con.darkMode();
      case 'about':
        _con.aboutApp();
        break;
      default:
    }
  }
}

/// Uses the String type as menu options
class AppMenuController extends AppPopupMenuController {
  ///
  factory AppMenuController() => _this ??= AppMenuController._();

  ///
  AppMenuController._();
  static AppMenuController? _this;
}
