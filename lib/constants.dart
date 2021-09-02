import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

/* ************** by Hamza **************** */

// login buttons;
const loginInputDecoration=InputDecoration(
contentPadding:
EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
border: OutlineInputBorder(
borderRadius: BorderRadius.all(Radius.circular(32.0)),
),
// when app starts
enabledBorder: OutlineInputBorder(
borderSide:
BorderSide(color: Colors.lightBlueAccent, width: 1.0),
borderRadius: BorderRadius.all(Radius.circular(32.0)),
),
// when user starts typing
focusedBorder: OutlineInputBorder(
borderSide:
BorderSide(color: Colors.lightBlueAccent, width: 2.0),
borderRadius: BorderRadius.all(Radius.circular(32.0)),
),
);

const loginHintTextStyle=TextStyle(
  color: Colors.lightBlueAccent,
);
const loginTextStyle=TextStyle(
  color: Colors.lightBlueAccent,
);

// registration buttons;
const registerInputDecoration=InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
// when app starts
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
// when user starts typing
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const registerHintTextStyle=TextStyle(
  color: Colors.blueAccent,
);
const registerTextStyle=TextStyle(
  color: Colors.blueAccent,
);


