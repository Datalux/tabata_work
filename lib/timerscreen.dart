import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tabatawork/endscreen.dart';


class TimerScreen extends StatefulWidget {
  int work, rest, rounds;
  bool active = false;
  bool working = true;


  Timer timer;

  TimerScreen({
    Key key,
    @required this.work,
    @required this.rest,
    @required this.rounds
  }) : super(key: key);

  @override
  _TimerScreen createState() => _TimerScreen();

}

class _TimerScreen extends State<TimerScreen>{


  void run(){
    if(widget.rounds > 0) { // already rounds
      widget.rounds -= widget.rounds;
      if(widget.working){ // working time

      } else { // rest time

      }
    } else { //no more rounds

    }


  }


  void startWorkTimer() {
    if(widget.active) {
      const oneSec = const Duration(seconds: 1);
      widget.timer = new Timer.periodic(
        oneSec,
            (Timer timer) =>
            setState(
                  () {
                if (widget.work < 1) {
                  timer.cancel();
                  widget.working = false;
                  startRestTimer();
                } else {
                  widget.work = widget.work - 1;
                }
              },
            ),
      );
    } else {
      widget.timer.cancel();
    }
  }

  void startRestTimer() {
    if(widget.active) {
      const oneSec = const Duration(seconds: 1);
      widget.timer = new Timer.periodic(
        oneSec,
            (Timer timer) =>
            setState(
                  () {
                if (widget.rest < 1) {
                  timer.cancel();
                  checkEnd();
                } else {
                  widget.rest = widget.rest - 1;
                }
              },
            ),
      );
    } else {
      widget.timer.cancel();
    }
  }

  void checkEnd(){
    print(widget.rounds.toString() + " " + widget.work.toString() + " " + widget.rest.toString() );
    if(widget.rounds == 0 && widget.work == 0 && widget.rest == 0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EndScreen()),
      );
    }
  }

  @override
  void dispose() {
    widget.timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.teal,
          height: double.infinity,
          width: double.infinity,
          child: Card(
            color: widget.working? Color(0xFFc8e6c9): Color(0xFFffccbc),
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
                      widget.working? "Work": "Rest",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 100,
                  height: 100,
                  child: FittedBox(
                    child: FloatingActionButton(
                      backgroundColor: !widget.active? Colors.green: Colors.red,
                      onPressed: () {
                        setState((){
                          widget.active = !widget.active;
                        });
                        if(widget.working)
                          startWorkTimer();
                        else
                          startRestTimer();
                      },
                      child: widget.active? Icon(Icons.pause): Icon(Icons.play_arrow),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text(
                      widget.working? widget.work.toString(): widget.rest.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50
                      ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
