import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Registration.dart';
import 'homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email, _password;

  void signIn(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .catchError((onError) {
      print(onError);
    }).then((authUser) {
      if (authUser.user != null) {
        Get.to(HomePage());
      }
    });
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      signIn(context);
      FocusScope.of(context).unfocus();
      /*
       (_email == "asd@asd.com" && _password == "asdfghjkl") 
      */
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email), labelText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: validateEmail,
                      onSaved: (String emailValue) {
                        _email = emailValue;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_open),
                          labelText: 'Password'),
                      keyboardType: TextInputType.text,
                      validator: validatePassword,
                      onSaved: (String passwordValue) {
                        _password = passwordValue;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {},
                        child: Text("forget Password?"),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 300.0,
                      child: RaisedButton(
                        onPressed: _validateInputs,
                        child: Text('Login to account'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Don't have an account?"),
                        FlatButton(
                          onPressed: () {
                            Get.to(Registration());
                          },
                          child: Text("Create Account"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

String validatePassword(String value) {
  if (value.isEmpty)
    return "Please Enter Password";
  else if (value.length < 8)
    return "Password length is low";
  else if (value.length > 15) return "Password length is high";
  return null;
}
