import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'package:firebase_database/firebase_database.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email, _password, _name, _phone;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signUp(BuildContext context) async {
    final databaseReference = FirebaseDatabase.instance.reference();
    final User user = _auth.currentUser;
    final uid = user.uid;
    String name = _name;
    // String phone = _phone;
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _email, password: _password)
        .catchError((onError) {
      print(onError);
    }).then((authUser) async {
      await FirebaseAuth.instance.currentUser.updateDisplayName(name);

      databaseReference.child(uid).set({
        'userid': uid,
        'Name': _name,
        'phone': _phone,
      });

      Get.to(Login());
    });
  }

  void _validateSingUpInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      signUp(context);
      FocusScope.of(context).unfocus();
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
                          prefixIcon: Icon(Icons.picture_in_picture),
                          labelText: 'Name'),
                      keyboardType: TextInputType.text,
                      validator: validateName,
                      onSaved: (String nameValue) {
                        _name = nameValue;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone), labelText: 'Mobile'),
                      keyboardType: TextInputType.phone,
                      validator: validateMobile,
                      onSaved: (String mobileValue) {
                        _phone = mobileValue;
                      },
                    ),
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
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 300.0,
                      child: RaisedButton(
                        onPressed: _validateSingUpInputs,
                        child: Text('SignUp your Account'),
                      ),
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

String validateName(String value) {
  if (value.isEmpty)
    return "Please Enter FullName";
  else if (value.length < 3)
    return 'Name must be more than 2 charater';
  else
    return null;
}

String validateMobile(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}
