import 'package:flutter/material.dart';
//  this file contain code for login and registration button

// ignore: camel_case_types
class roundButton extends StatelessWidget {
  roundButton(
      {@required this.title,
      @required this.passedColor,
      @required this.tagHero,
      this.navigationID,
      @required this.onPressed});

  final String tagHero;
  final String title;
  final Color passedColor;
  final String navigationID;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tagHero,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          elevation: 5.0,
          color: passedColor,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed:  onPressed
              //   () {
              // //Go to corresponding screen.
              // Navigator.pushNamed(context, navigationID);
      //      }
              ,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
