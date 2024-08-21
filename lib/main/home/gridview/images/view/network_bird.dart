// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
///
///  This widget works with the free Bird API.
///

import '/src/controller.dart';

import '/src/view.dart';

///
class NetworkBird extends StatefulWidget {
  ///
  const NetworkBird({super.key});
  @override
  State<StatefulWidget> createState() => _NetworkBirdState();
}

class _NetworkBirdState extends ImageAPIStateX<NetworkBird> {
  _NetworkBirdState()
      : super(
          controller: BirdController(),
          message: 'message',
          uri: Uri(
            scheme: 'https',
            host: 'api.sefinek.net',
            path: 'api/v2/random/animal/bird',
          ),
        );

  /// Called when the application's UI dimensions change.
  /// For example, when a phone is rotated.
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
  }
}
