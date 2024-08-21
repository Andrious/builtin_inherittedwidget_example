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
          key: const Key('inherited'),
          value: 'inherited',
          child: ListTile(
            leading:
                _con.useInherited ? const Icon(Icons.circle) : const Text(' '),
            title: Text('Use InheritedWidget'.tr),
          ),
        ),
        PopupMenuItem(
          key: const Key('home'),
          value: 'home',
          child: ListTile(
            leading: _con.callHome ? const Icon(Icons.circle) : const Text(' '),
            title: Text('Call Home Page'.tr),
          ),
        ),
        PopupMenuItem(
          key: const Key('newKey'),
          value: 'newKey',
          child: ListTile(
            leading: _con.recreateStates
                ? const Icon(Icons.circle)
                : const Text(' '),
            title: Text('Recreate State objects'.tr),
          ),
        ),
        if (App.useMaterial)
          PopupMenuItem(
            key: const Key('darkModeItem'),
            value: 'darkMode',
            child: ListTile(
              leading:
                  _con.inDarkMode ? const Icon(Icons.circle) : const Text(' '),
              title: Text('Dark Mode'.tr),
            ),
          ),
        PopupMenuItem(
          key: const Key('aboutMenuItem'),
          value: 'about',
          child: ListTile(
            leading: const Text(' '),
            title: Text('About'.tr),
          ),
        ),
      ];

  /// When an menu item is selected
  @override
  Future<void> onSelected(String value) async {
    switch (value) {
      case 'inherited':
        _con.useInheritedWidget();
        break;
      case 'home':
        _con.callHomeWidget();
        break;
      case 'newKey':
        _con.recreateStateObjects();
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
