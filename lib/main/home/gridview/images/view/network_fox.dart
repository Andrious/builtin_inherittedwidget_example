// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
///
///  This widget works with the free Fox API.
///

import '/src/controller.dart';

import '/src/view.dart';

///
class NetworkFox extends StatefulWidget {
  ///
  const NetworkFox({super.key});
  @override
  State<StatefulWidget> createState() => _NetworkFoxState();
}

class _NetworkFoxState extends ImageAPIStateX<NetworkFox> {
  _NetworkFoxState()
      : super(
          controller: FoxController(),
          uri: Uri(
            scheme: 'https',
            host: 'randomfox.ca',
            path: 'floof',
          ),
          message: 'image',
        );
}
