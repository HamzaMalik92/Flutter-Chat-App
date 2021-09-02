import 'package:flash_chat_app_1/components/round_Button.dart';
import 'package:flash_chat_app_1/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:route_transitions/route_transitions.dart' as route_transitions;
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegistrationScreen extends StatefulWidget {
  static const String id = 'Registration_Screen';

  @override
  _RegistrationScreenState createState()  {

    return _RegistrationScreenState();
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // creating variables
  String email;
  String password;

 final _auth=FirebaseAuth.instance;

 var showSpinner=false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(  // for loading circle
        inAsyncCall: showSpinner,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child:Hero(
                  tag: 'logo',
                  child: Container(
                    // for logo image
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
                    email=value;
                    //Do something with the user input.
                  },
                  decoration: registerInputDecoration.copyWith(hintText: 'Enter your email',
                      hintStyle:registerHintTextStyle),
                  style: registerTextStyle,
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  obscureText: true, // used for passwords
                  onChanged: (value) {
                    //Do something with the user input.
                    password=value;
                  },
                  decoration: registerInputDecoration.copyWith(hintText: 'Enter your password',
                    hintStyle:registerHintTextStyle),
            style: registerTextStyle,
                ),
                SizedBox(
                  height: 24.0,
                ),
                // Registration button
                roundButton(
                    title: 'Register',
                    passedColor: Colors.blueAccent,
                    tagHero: 'register',
                    onPressed:() async{
                          setState(() {
                            showSpinner=true;
                          });
try{
  final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
  if(newUser!=null){
    print(newUser);
 //   Navigator.pushNamed(context,ChatScreen.id);
    Navigator.of(context).push(route_transitions.PageRouteTransition(builder: (context)=>ChatScreen(),
      animationType: route_transitions.AnimationType.fade,
    ),
);
  }
  setState(() {
    showSpinner=false;
  });
}
catch(e){
  print(e);
  setState(() {
    showSpinner=false;
  });

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
          color:Colors.blueAccent,
        )
      ]).show();
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
