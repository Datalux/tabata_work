import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:tabatawork/timerscreen.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.teal
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'TabataWork'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class RowItem extends StatefulWidget{
  final String title;
  final Color color;

  int _counter = 0;

  RowItem ({ Key key, this.title, this.color}): super(key: key);

  int get counter => _counter;


  @override
  _RowItem createState() => _RowItem();
}

class _RowItem extends State<RowItem>{
  //int _counter = 0;


  void _increaseCounter() {
    setState(() { widget._counter += 1; });
  }

  void _decreaseCounter() {
    setState(() {
      if(widget._counter > 0)
      widget._counter -= 1;
    });
  }

  Future _showIntDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          minValue: 0,
          maxValue: 120,
          step: 1,
          initialIntegerValue: widget._counter,
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() => widget._counter = value);
        //integerNumberPicker.animateInt(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0)
        ),
        elevation: 2.0,
        color: widget.color,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _showIntDialog(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () => {
                        _decreaseCounter()
                      },
                    ),
                    GestureDetector(
                      child: Text(
                        widget.counter.toString(),
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                        ),
                      //onTap: () => _showIntDialog(),
                    ),
                    new IconButton(
                      icon: new Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () => {
                        _increaseCounter()
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}



class _MyHomePageState extends State<MyHomePage> {

  RowItem work = new RowItem(title: "Work Time", color: Colors.red);
  RowItem rest = new RowItem(title: "Rest Time", color: Colors.green);
  RowItem rounds = new RowItem(title: "Rounds", color: Colors.deepPurple);

  void showSnackbar(){
    final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
    Scaffold.of(context).showSnackBar(snackBar);
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
            elevation: 0,
            margin: EdgeInsets.only(top: 0.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Column(
                children: <Widget>[
                  work,
                  rest,
                  rounds

                ],
              ),
            ),

          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 56.0,
        ),
        color: Colors.teal,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Builder(
        builder: (mContext) => FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(Icons.done),
            onPressed: () {
              //TODO: do check
              /*if(rounds.counter > 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                      TimerScreen(
                        work: work.counter,
                        rest: rest.counter,
                        rounds: rounds.counter,
                      )),
                );
              } else {
                Scaffold.of(mContext).showSnackBar(SnackBar(
                  content: Text("Invalid rounds number!"),
                  duration: Duration(milliseconds: 500),
                ));
              }*/
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    TimerScreen(
                      work: work.counter,
                      rest: rest.counter,
                      rounds: rounds.counter,
                    )),
              );
            }
            ),
      ),

    );
  }
}
