// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
///
///  This widget works with the free Dog API.
///

import '/src/controller.dart';

import '/src/view.dart';

///
class NetworkDog extends StatefulWidget {
  ///
  const NetworkDog({super.key});
  @override
  State<StatefulWidget> createState() => _NetworkDogState();
}

class _NetworkDogState extends ImageAPIStateX<NetworkDog> {
  _NetworkDogState()
      : super(
          controller: DogController(),
          uri: Uri(
            scheme: 'https',
            host: 'dog.ceo',
            path: 'api/breeds/image/random/1',
          ),
          message: 'message',
        );
}