import 'package:flutter/material.dart';
import 'package:tubes_baru/Login&Register/RegisterPage.dart';
import 'package:tubes_baru/MainPage.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:tubes_baru/sql_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;
  bool _isObscure = true;

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    final db = DatabaseHelper();
    final users = await db.getUsers();

    bool isUserExists = false;

    for (var user in users) {
      if (user['username'] == _username && user['password'] == _password) {
        isUserExists = true;
        break;
      }
    }

    if (isUserExists) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPageApp()),
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid username or password.'),
            actions: [
        TextButton(
        child: Text('OK'),
    onPressed: () {
    Navigator.of(context).pop();
    },
        ),
            ],
        );
          },
      );
    }
  }


    @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        key: _formKey,
            children: [
              SizedBox(
                width: w,
                height: h*0.2,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right:20),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello",
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign into your account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.yellow,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: TextField(
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.yellow,
                          ),
                          suffixIcon: IconButton(
                              iconSize: 20.0,
                              icon: _isObscure
                                  ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                                  : const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                              onPressed: (){
                                setState(() {
                                  _isObscure = ! _isObscure;
                                });
                              },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 160,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(270),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MainPageApp();
                    }));
                  },
                  child: const Text('Login'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "Don\ 't have an account?",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                        text: " Create",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(() => RegisterPage())),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
