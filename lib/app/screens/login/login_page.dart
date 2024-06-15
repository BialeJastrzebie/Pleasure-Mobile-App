import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/screens/login/widgets/email_input.dart';
import 'package:pleasure_mobile_app/app/screens/login/widgets/password_input.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';
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
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'PŁeasure',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w400,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(0, 7),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 150)),
                EmailInput(controller: _usernameController),
                const Padding(padding: EdgeInsets.only(top: 20)),
                PasswordInput(controller: _passwordController),
                const Padding(padding: EdgeInsets.only(top: 40)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shadowColor: Colors.black,
                    elevation: 10,
                    minimumSize: const Size(250, 60),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a Snackbar and authenticate the user.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Center(
                            child: Text(
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black87,
                                ),
                                'Trwa logowanie...'),
                          ),
                        ),
                      );
                      authenticate(_usernameController.text,
                              _passwordController.text)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 3),
                            content: Center(
                              child: Text(
                                'Zalogowano pomyślnie',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: backgroundColor,
                                ),
                              ),
                            ),
                          ),
                        );
                        Navigator.pushNamed(context, '/home');
                      }).catchError((error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(seconds: 3),
                            content: Center(
                              child: Text(
                                'Nie udało się zalogować',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  color: backgroundColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    }
                  },
                  child: const Text(
                    'Zaloguj się',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
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
  Map<String, String> data = {'email': username, 'password': password};
  String jsonString = jsonEncode(data);

  final response = await http.post(
    Uri.parse('http://localhost:8000/api/user/token/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonString,
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
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    String responseBody = utf8.decode(response.bodyBytes);
    return jsonDecode(responseBody);
  } else {
    throw Exception('Failed to load data');
  }
}


Future<dynamic> patchData(String url, Map<String, dynamic> data) async {
  String token = await getToken();
  String jsonString = jsonEncode(data);

  final response = await http.patch(
    Uri.parse(url),
    headers: <String, String>{
      'Authorization': 'Token $token',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonString,
  );
  print(response.body);
  print(response.statusCode);
  if (response.statusCode == 200) {
    String responseBody = utf8.decode(response.bodyBytes);
    return jsonDecode(responseBody);
  } else {
    throw Exception('Failed to patch data');
  }
}

Future<dynamic> postData(String url, Map<String, dynamic> data) async {
  String token = await getToken();
  String jsonString = jsonEncode(data);

  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Authorization': 'Token $token',
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonString,
  );
  print(response.body);
  print(response.statusCode);
  if (response.statusCode == 201) {
    String responseBody = utf8.decode(response.bodyBytes);
    return jsonDecode(responseBody);
  } else {
    throw Exception('Failed to post data');
  }
}

Future<bool> checkInternetConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}
