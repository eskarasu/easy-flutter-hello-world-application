import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// MyApp is a StatelessWidget which renders the home screen of the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp is the root widget of the application.
    return MaterialApp(
      // Scaffold provides the structure of the home screen.
      home: Scaffold(
        // AppBar is the header bar of the app, containing the title.
        appBar: AppBar(
          title: Text('Hello World Application'),
        ),
        // The body of the Scaffold is a Center widget containing a Text widget.
        body: Center(
          // The Text widget displays 'Hello World!' on the screen.
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
