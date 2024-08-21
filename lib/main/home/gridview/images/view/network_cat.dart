// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
///
///  This widget works with the free Cat API.
///
import '/src/controller.dart';

import '/src/view.dart';

///
class NetworkCat extends StatefulWidget {
  ///
  const NetworkCat({super.key});
  @override
  State<StatefulWidget> createState() => _NetworkCatState();
}

class _NetworkCatState extends ImageAPIStateX<NetworkCat> {
  _NetworkCatState()
      : super(
          controller: CatController(),
          message: 'message',
          uri: Uri(
            scheme: 'https',
            host: 'api.sefinek.net',
            path: 'api/v2/random/animal/cat',
          ),
        );

  /// Supply a 'splash screen' while the FutureBuilder is processing.
  @override
  Widget? onSplashScreen(BuildContext context) => const SplashScreen();
}
