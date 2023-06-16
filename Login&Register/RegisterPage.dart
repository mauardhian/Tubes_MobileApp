import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_baru/Login&Register/LoginPage.dart';
import 'package:tubes_baru/sql_helper.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;
  late String _nama;
  late String _NoHandphone;
  bool _isObscure = true;

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    final user = {'username': _username, 'password': _password, 'nama': _nama, 'NoHandaphone': _NoHandphone};

    final db = DatabaseHelper();
    await db.saveUser(user);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Successful'),
          content: Text('User registered successfully.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));

              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                width: w,
                height: h*0.1,
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
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign Up your account",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(
                      Icons.person,
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
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter a name';
                    return null;
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                ),
              ),
              SizedBox(
                height: 15,
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
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "NoHanphone",
                    prefixIcon: Icon(
                      Icons.phone_android_rounded,
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
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter a NoHandphone';
                    return null;
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                ),
              ),
              SizedBox(
                height: 15,
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
              child: TextFormField(
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
                  validator: (value) {
                  if (value!.isEmpty) return 'Please enter a username';
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              ),
              SizedBox(
                height: 15,
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
                child: TextFormField(
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
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter a password';
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
              ),

              SizedBox(height: 28),
              Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),

                ),
                child: TextButton(
                  child: Text('Sign Up', style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
                  onPressed: _submitForm,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "have an account?",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 20,
                      ),
                      children: [
                        TextSpan(
                            text: " Login",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.to(() => LoginPage())),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}