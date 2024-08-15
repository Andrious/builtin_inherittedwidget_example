//
import '/src/controller.dart';

import '/src/view.dart';

/// App
class ExampleApp extends AppStatefulWidget {
  ///
  ExampleApp({super.key});
  // This is the 'App State object' of the application.
  @override
  AppState createAppState() => _ExampleAppState();
}

/// This is the 'View' of the application.
/// The 'look and behavior' of the app.
///
class _ExampleAppState extends AppState {
  _ExampleAppState()
      : super(
          controller: ExampleAppController(),
          inTitle: () => 'Demo App',
          inDebugShowCheckedModeBanner: () => false,
//          debugPaintSizeEnabled: true,
          home: const HomePage(),
        );
}
