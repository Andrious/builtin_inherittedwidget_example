// Copyright 2022 Andrious Solutions Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
///
///  The StatefulWidget representing the app's Home Page.
///

import '/src/controller.dart';

import '/src/view.dart';

/// The Home page
class HomePage extends StatefulWidget {
  ///
  const HomePage({super.key, this.title});

  ///
  final String? title;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends StateX<HomePage> {
  _HomePageState() : super(controller: HomeController()) {
    con = controller as HomeController;
  }
  late HomeController con;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? 'Built-in InheritedWidget Demo.'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: InheritBird(
          child: InheritCat(
            child: InheritDog(
              child: InheritFox(
                child: GridView.count(
                  crossAxisCount: HomeController().crossCount,
                  children: con.children,
                ),
              ),
            ),
          ),
        ),
        persistentFooterButtons: [
          OverflowBar(
            children: [
              TextButton(
                onPressed: () => con.newDogs(),
                child: const Text('New Dogs'),
              ),
              TextButton(
                onPressed: () => con.newCats(),
                child: const Text('New Cats'),
              ),
              TextButton(
                onPressed: () => con.newFoxes(),
                child: const Text('New Foxes'),
              ),
              TextButton(
                onPressed: () => con.newBirds(),
                child: const Text('New Birds'),
              ),
            ],
          ),
        ],
      );
}
