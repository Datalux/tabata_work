import 'package:flutter/material.dart';


class EndScreen extends StatefulWidget {
  int work, rest, rounds;
  bool active = false;
  bool working = true;



  EndScreen({
    Key key,
    @required this.work,
    @required this.rest,
    @required this.rounds
  }) : super(key: key);

  @override
  _EndScreen createState() => _EndScreen();

}

class _EndScreen extends State<EndScreen>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.teal,
          height: double.infinity,
          width: double.infinity,
          child: Card(
            color: Color(0xFF81c784),
            elevation: 1,
            margin: EdgeInsets.only(top: 0.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 156),
                  child: Center(
                    child: Text(
                      "Well done!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
