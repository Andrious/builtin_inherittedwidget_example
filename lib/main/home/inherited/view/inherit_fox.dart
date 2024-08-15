// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
///
///  This StatefulWidget works with the Fox InheritedWidget.
///

import '/src/controller.dart';

import '/src/view.dart';

/// This StatefulWidget stores an InheritedWidget
class InheritFox extends StatefulWidget {
  ///
  const InheritFox({super.key, required this.child});

  ///
  final Widget child;

  @override
  State<StatefulWidget> createState() => _InheritFoxState();
}

class _InheritFoxState extends StateX<InheritFox> {
  _InheritFoxState() : super(controller: FoxController(), useInherited: true);

  @override
  Widget buildIn(context) => widget.child;
}
