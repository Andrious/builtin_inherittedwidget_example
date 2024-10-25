// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//
//  The 'Animal' Controller to call the appropriate InheritedWidget.
//

import '/src/controller.dart';

import '/src/view.dart';

///
class InheritController extends StateXController {
  /// Link this Controller's Widget to a specific InheritedWidget
  /// The InheritedWidget is the first State object it registered with.
  @override
  bool dependOnInheritedWidget(BuildContext? context) =>
      firstState?.dependOnInheritedWidget(context) ?? false;

  /// Rebuild the InheritedWidget to also rebuild its dependencies.
  void newAnimals() {
      firstState?.notifyClients();
      ExampleAppController().runInitAsync = true;
  }
}
