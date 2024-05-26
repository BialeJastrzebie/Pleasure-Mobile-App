import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/widgets/base_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a Snackbar and authenticate the user.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      authenticate(
                          _usernameController.text, _passwordController.text);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

Future<String> authenticate(String username, String password) async {
  final response = await http.post(
    Uri.parse('http://0.0.0.0:5432/api/user/token/'),
    headers: <String, String>{
      'Content-Type': 'text/plain; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    String token = jsonDecode(response.body)['token'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    return token;
  } else {
    throw Exception('Failed to authenticate');
  }
}

Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  if (token == null) {
    throw Exception('No token found');
  }
  return token;
}

Future<dynamic> fetchData(String url) async {
  String token = await getToken();
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Authorization': 'Token $token',
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
