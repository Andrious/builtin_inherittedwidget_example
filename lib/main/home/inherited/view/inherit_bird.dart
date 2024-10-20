// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
///
///  Contains the InheritedWidget for updating the Bird Image widgets.
///

import '/src/controller.dart';

import '/src/view.dart';

///
class InheritBird extends StatefulWidget {
  ///
  InheritBird({required this.child}) : super(key: UniqueKey());

  ///
  final Widget child;

  @override
  State<StatefulWidget> createState() => _InheritBirdState();
}

class _InheritBirdState extends StateX<InheritBird> {
  _InheritBirdState()
      : super(
          controller: BirdController(),
          useInherited: ExampleAppController().useInherited,
        );

  @override
  Widget builder(context) => widget.child;
}
