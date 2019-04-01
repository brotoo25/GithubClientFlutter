import 'package:flutter/material.dart';
import 'screens/repositories_screen.dart';

class App extends StatelessWidget {

  Widget build(context) {

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: RepositoryList(),
      ),
    );
  }
}