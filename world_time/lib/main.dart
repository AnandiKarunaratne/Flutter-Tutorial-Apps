import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
// import 'pages/home.dart'; // this is okay
import 'package:world_time/pages/home.dart'; // this is better
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
  // home: Home(),
  // initialRoute: '/home', // for testing purposes if we need to test another screen
  routes: { // this is a map. it needs key-value pairs
    '/': (context)  => Loading(), // context object keeps track of where is the widget tree we are
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  }
));

// DART - Maps
//
// void main() {
//   Map student = {'name': 'anandi', 'age': 25};
//   print(student['name']);
// }

// WIDGET LIFECYCLE
// ----------------
//
//     Stateless:
//     - State does not change over time
//     - build function only runs once
//
//     Stateful:
//     - State can change over time
//     - setState() triggers the build function
//
// Stateful Widgets
// ----------------
// 1. initState()
//     - called only once when the widget is created
//     - subscribe to streams or any object that could change our widget data
//
// 2. Build()
//     - builds the widget tree
//     - a build is triggered every time we use setState()
//
// 3. Dispose()
//     - when the widget/state object is removed