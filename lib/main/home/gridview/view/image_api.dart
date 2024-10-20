// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
///
///  Manages the API request for specifically 'image' public API's
///

import '/src/controller.dart';

import '/src/view.dart';

/// The State object allows for a web service to be called.
class ImageAPIStateX<T extends StatefulWidget> extends StateX<T>
    implements ImageAPIState {
  ///
  ImageAPIStateX({
    required this.uri,
    this.message,
    super.controller,
// Always run the initAsync() function
  }) : super(runAsync: true) {
//
    final id = add(ImageAPIController());
// Retrieve the stored Controller by its unique id.
    _con = controllerById(id) as ImageAPIController;
// Retrieve the stored Controller by type if you want
    _con = controllerByType<ImageAPIController>();
  }

  ///
  @override
  final Uri? uri;

  ///
  @override
  final String? message;

  ImageAPIController? _con;

  /// Place a breakpoint on this build() function and see how things work.
  @override
// ignore: unnecessary_overrides
  Widget build(BuildContext context) => super.build(context);

  /// Supply a widget to the built-in FutureBuilder.
  @override
  Widget builder(context) {
    controller?.dependOnInheritedWidget(context);
    return GestureDetector(
      onTap: _con?.onTap,
      onDoubleTap: _con?.onDoubleTap,
      child: Card(child: _con?.image ?? const SizedBox.shrink()),
    );
  }

  @override
  bool runInitAsync() {
    final appController = ExampleAppController();
    // runFuture is the changeable menu option, runInitAsync is set false to set Dark Mode.
    return appController.runFuture && appController.runInitAsync;
  }

  @override
  void setState(VoidCallback fn) {
    ExampleAppController().runInitAsync = true;
    super.setState(fn);
  }
}

///
abstract class ImageAPIState {
  ///
  ImageAPIState({required this.uri, required this.message});

  ///
  final Uri? uri;

  ///
  final String? message;
}
