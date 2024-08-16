// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
///
///  The Controller for this app's Home Page StatefulWidget.
///

import '/src/controller.dart';

import '/src/view.dart';

///
class HomeController extends StateXController {
  ///
  factory HomeController({int? crossCount}) =>
      _this ??= HomeController._(crossCount ?? 3);
  HomeController._(this.crossCount);
  static HomeController? _this;

  /// Number of columns in the Grid
  final int crossCount;

  /// The List of Widgets
  List<Widget> get children => _randomGrid();

  /// Randomly arranged the photos of four animals
  List<Widget> _randomGrid() {
    // Default number is assigned if one is not provided.
    final List<Widget> images = [];
    final animals = [1, 2, 3, 4];

    int cnt = 0;

    int dog = 0;
    int cat = 0;
    int fox = 0;
    int bird = 0;

    final number = crossCount * animals.length;
    final limit = crossCount;

    while (cnt < number) {
      // Shuffle the elements
      animals.shuffle();
      final index = animals[0];
      switch (index) {
        case 1:
          if (dog == limit) {
            // try again.
            continue;
          } else {
            dog++;
            images.add(speciesList(index));
          }
          break;
        case 2:
          if (cat == limit) {
            // try again.
            continue;
          } else {
            cat++;
            images.add(speciesList(index));
          }
          break;
        case 3:
          if (fox == limit) {
            // try again.
            continue;
          } else {
            fox++;
            images.add(speciesList(index));
          }
          break;
        case 4:
          if (bird == limit) {
            // try again.
            continue;
          } else {
            bird++;
            images.add(speciesList(index));
          }
          break;
      }
      cnt++;
    }
    return images;
  }

  ///
  void newBirds() => BirdController().newAnimals();

  ///
  void newCats() => CatController().newAnimals();

  ///
  void newDogs() => DogController().newAnimals();

  ///
  void newFoxes() => FoxController().newAnimals();

  /// A certain index, a certain animal
  Widget speciesList(int index) {
    Widget widget;
    switch (index) {
      case 1:
        widget = const RandomDog();
        break;
      case 2:
        widget = const RandomCat();
        break;
      case 3:
        widget = const RandomFox();
        break;
      default:
        widget = const RandomBird();
        break;
    }
    return widget;
  }
}
