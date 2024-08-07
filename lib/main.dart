import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

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
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Map<String, String> _users = {};
  String _message = '';

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final String response = await rootBundle.loadString('assets/users.json');
    final data = await json.decode(response);
    setState(() {
      _users = Map<String, String>.from(data);
    });
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (_users.containsKey(username) && _users[username] == password) {
      setState(() {
        _message = 'Login successful';
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TurquoisePage()),
      );
    } else {
      setState(() {
        _message = 'Invalid username or password';
      });
    }
  }

  void _signUp() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      if (!_users.containsKey(username)) {
        setState(() {
          _users[username] = password;
          _message = 'User registered successfully';
        });
      } else {
        setState(() {
          _message = 'Username already exists';
        });
      }
    } else {
      setState(() {
        _message = 'Please enter a valid username and password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: _signUp,
              child: Text('Sign Up'),
            ),
          ),
          Text(_message),
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
