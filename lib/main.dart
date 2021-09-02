import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_app_1/screens/developer_card.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_app_1/screens/welcome_screen.dart';
import 'package:flash_chat_app_1/screens/login_screen.dart';
import 'package:flash_chat_app_1/screens/registration_screen.dart';
import 'package:flash_chat_app_1/screens/chat_screen.dart';

void main()   {
   WidgetsFlutterBinding.ensureInitialized(); // for initializing firebase - essential
    runApp(FlashChat());
 }

// void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            //   defining routes for navigation
            home: WelcomeScreen(),
     //       initialRoute: WelcomeScreen.id,
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              ChatScreen.id: (context) => ChatScreen(),
              developer_card.id:(context)=>developer_card()
            },
          );
        } else {  // app failed to initialize firebase
          return MaterialApp(
            theme: ThemeData.dark().copyWith(

             ),

            home: Scaffold(
              appBar: AppBar(
                title: Text('Flash Chat App'),
                backgroundColor: Colors.blueAccent,
              ),
                body:Text('Error'),
              backgroundColor: Colors.white,
            ),
          );
        }
      },
    );
  }
}
