import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World Application'),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Creating a new StatefulWidget to track the state of form fields.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        // ...
        children: <Widget>[
          // ...
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Safely calling the 'validate' method by adding null check.
                if (_formKey.currentState?.validate() ?? false) {
                  // If the form is valid, navigate to a new page with turquoise background.
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TurquoisePage()),
                  );
                }
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}

class TurquoisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan, // Turquoise color
      appBar: AppBar(
        title: Text('Turquoise Page'),
      ),
      body: Center(
        child: Image.asset('assets/images/image.png'), // Centering the image
      ),
    );
  }
}
