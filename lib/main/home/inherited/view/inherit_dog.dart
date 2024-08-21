// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
///
///  This StatefulWidget works with the 'Dog' InheritedWidget
///

import '/src/controller.dart';

import '/src/view.dart';

/// This StatefulWidget stores an InheritedWidget
class InheritDog extends StatefulWidget {
  ///
  InheritDog({required this.child})
      : super(key: InheritController.newKey ? UniqueKey() : null);

  ///
  final Widget child;

  @override
  State<StatefulWidget> createState() => _InheritDogState();
}

class _InheritDogState extends StateX<InheritDog> {
  _InheritDogState()
      : super(
          controller: DogController(),
          useInherited: InheritController.useInherited,
        );

  @override
  Widget builder(context) => widget.child;
}
