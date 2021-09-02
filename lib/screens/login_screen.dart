import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_app_1/components/round_Button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:route_transitions/route_transitions.dart' as route_transitions;

import '../constants.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'Login_Screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // creating variables
  String email;
  String password;

  final _auth = FirebaseAuth.instance;

  var showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner, // spinner will stop when true is passed
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                               Flexible(  // logo will try to be size of 200 if space not available then become small in size
                  child:Hero(
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
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: loginInputDecoration.copyWith(
                      hintText: 'Enter your email',
                      hintStyle: loginHintTextStyle),
                  style: loginTextStyle,
                ),

                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true, // used for passwords
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: loginInputDecoration.copyWith(
                      hintText: 'Enter your password',
                      hintStyle: loginHintTextStyle),
                  // by Hamza
                  style: loginTextStyle,
                ),
                SizedBox(
                  height: 24.0,
                ),
                // Login button
                roundButton(
                  title: 'Login',
                  passedColor: Colors.lightBlueAccent,
                  tagHero: 'login',
                  //    navigationID: LoginScreen.id,
                  onPressed: () async {
                    print(email);

                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (newUser != null) {
                        print(newUser);
                        //   Navigator.pushNamed(context,ChatScreen.id);
                        Navigator.of(context).push(route_transitions.PageRouteTransition(builder: (context)=>ChatScreen(),
                          animationType: route_transitions.AnimationType.fade,
                        ),
                        );
                      }
                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      print(e);
                      setState(() {
                        showSpinner = false;
                        Alert(context: context, title: 'ERROR',desc: e.toString(),
                            type: AlertType.error,
                            style: AlertStyle(
                              titleStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.red
                              )
                            ),
                            closeIcon: Icon(Icons.close,size: 30,)
                            ,
                            buttons: [
                              DialogButton(
                                onPressed: ()=>Navigator.pop(context),
                                child: Text(
                                  'Try Again',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),

                                ),
                                width: 150,
                                color:Colors.lightBlueAccent,
                              )
                            ]).show();

                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
