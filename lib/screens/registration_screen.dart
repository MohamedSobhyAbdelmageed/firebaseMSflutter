import 'package:firebasemsflutter/components/rounded_button.dart';
import 'package:firebasemsflutter/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = '/registeration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isWaiting = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isWaiting,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDeco.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration:
                      kTextFieldDeco.copyWith(hintText: 'Enter your password')),
              RoundedButton(
                  textBtn: 'Register',
                  colBtn: Colors.blueAccent,
                  onPressed: () async {
                    setState(() {
                      isWaiting = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        isWaiting = false;
                      });
                    } catch (e) {
                      print(e);
                    }
                  }),
              RoundedButton(
                  textBtn: 'Home',
                  colBtn: Colors.red,
                  onPressed: () {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
