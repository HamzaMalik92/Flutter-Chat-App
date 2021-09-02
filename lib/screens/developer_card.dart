import 'package:flutter/material.dart';


class developer_card extends StatefulWidget {
  static const String id = 'developer_card';

  @override
  _developer_cardState createState() => _developer_cardState();
}

class _developer_cardState extends State<developer_card> {
  
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/hamza.jpg',),

              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Hamza Malik',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontFamily: 'Pacifico',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                    fontFamily: 'Source Sans Pro',
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  height: 20,
                  width: 160,
                  child: Divider(
                    color: Colors.teal.shade100,
                  )),

              /*          Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    //    padding: EdgeInsets.all(10),
                    child: Padding(
                      padding: EdgeInsets.all(1),
                      child : ListTile(
                        leading:   Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                        title: Text(
                              '0309 9109661',
                              style: TextStyle(
                              color: Colors.teal.shade900,
                              fontFamily:  'Source Sans Pro',

                            ),
                      ),

                        )
                    ),

                      ),  */
              Card(
                //     color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                //    padding: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '0309 9109661',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontFamily: 'Source Sans Pro',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                //     color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                //    padding: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'hamzamalikapps7@gmail.com',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontFamily: 'Source Sans Pro',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )

        //   body: ,
        );
  }
}

