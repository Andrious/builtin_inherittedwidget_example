// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
///
///  Stores the InheritedWidget used to update the Cat images.
///

import '/src/controller.dart';

import '/src/view.dart';

/// This StatefulWidget stores an InheritedWidget
class InheritCat extends StatefulWidget {
  ///
  InheritCat({required this.child}) : super(key: UniqueKey());

  ///
  final Widget child;

  @override
  State<StatefulWidget> createState() => _InheritCatState();
}

class _InheritCatState extends StateX<InheritCat> {
  _InheritCatState()
      : super(
          controller: CatController(),
          useInherited: ExampleAppController().useInherited,
        );

  /// Place a breakpoint and see how things work.
  @override
  // ignore: unnecessary_overrides
  Widget build(BuildContext context) => super.build(context);

  /// Place a breakpoint and see how things work.
  @override
  // ignore: unnecessary_overrides
  Widget buildF(BuildContext context) => super.buildF(context);

  /// Place a breakpoint and see how things work.
  @override
  Widget builder(context) => widget.child;
}
