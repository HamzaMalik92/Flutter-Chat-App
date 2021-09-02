import 'package:flash_chat_app_1/components/round_Button.dart';
import 'package:flash_chat_app_1/screens/developer_card.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // for using predefined animation
import 'package:route_transitions/route_transitions.dart' as route_transitions;


class WelcomeScreen extends StatefulWidget {
  // to create const inside a class, use static, with static keyword const will not created
  static const String id = 'Welcome_Screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // "with" keyword to use for mixin { // function }

  AnimationController controller;

  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      // ticking of clock -- here ticker will provided by _WelcomeScreenState - use this keyword
      duration: Duration(
          // animation running time
          seconds: 1),
      upperBound: 1.0,
      lowerBound: 0.0,
    );

// curved animation
    /*  animation = CurvedAnimation(
      // 0 - 1
      parent: controller,
      curve: Curves.decelerate, // curve type
    ); */
// ColorTween Animation - Tween : It's  set of predefined tween animations that essentially go in between values
    animation = ColorTween(
      begin: Colors.blueGrey.shade100,
      end: Colors.white,
    ).animate(controller);

    controller.forward(); // animation start in forward direction -- from 0 to 1
    /*    controller.reverse(
      from: 1, // new starting point
    ); // animation start in reverse direction -- from 1 to 0

      animation.addStatusListener((status) {
      print(status);
    }); */
    animation.addListener(
      () {
        // call back function
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    // Called when this object is removed from the tree permanently.
    super.dispose();
    controller.dispose(); // kill controller when screen destroy or dispose
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: animation.value,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                  TypewriterAnimatedTextKit(
                    text: ['Flash Chat'],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.grey.shade800,
                    ),
                    speed: Duration(milliseconds: 300),
                    totalRepeatCount: 3,
                    // pause: Duration(milliseconds: 700),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              // login and registration buttons
              roundButton(
                  title: 'Login',
                  passedColor: Colors.lightBlueAccent,
                  tagHero: 'login',
                  navigationID: LoginScreen.id,
                  onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
              roundButton(
                  title: 'Register',
                  passedColor: Colors.blueAccent,
                  tagHero: 'register',
                  navigationID: RegistrationScreen.id,
                  onPressed: (){
                   Navigator.pushNamed(context, RegistrationScreen.id);
                  }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed:(){
    //      Navigator.pushNamed(context, developer_card.id);
          Navigator.of(context).push(route_transitions.PageRouteTransition(builder: (context)=>developer_card(),
            animationType: route_transitions.AnimationType.fade,
          ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.contact_mail,size:30,),),
      ),
    );
  }
}
