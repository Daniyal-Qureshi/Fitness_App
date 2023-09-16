import 'package:fitness_geek/login.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // initialize the Flutter bindings

  await Hive.initFlutter(); // initialize the Hive library for Flutter
  await Hive.openBox("fitnessx"); // open a Hive box for the app data storage

  runApp( App() );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // disable the debug banner
      home: Login(), // set the home screen to the Login screen
    );
  }
}
