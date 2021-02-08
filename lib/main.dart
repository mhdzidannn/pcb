import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(IOSApp());
}

class IOSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CupertinoHomePage extends StatefulWidget {
  CupertinoHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CupertinoHomePageState createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  double _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _powerCounter() {
    setState(() {
      _counter= _counter * _counter;
    });
  }

  void _rootCounter() {
    setState(() {
      _counter= sqrt(_counter);
    });
  }

  void _resetCounter() {
    setState(() {
      _counter= 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Text(
                'You have pushed the button this many times:',
              ),

              SizedBox(height: 10,),

              Text(
                //'${_counter.toStringAsPrecision(2)}',
                '$_counter'
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    child: Text('Add'),
                    onPressed: () => _incrementCounter(),
                  ),
                  CupertinoButton(
                    child: Text('Subtract'),
                    onPressed: () => _decrementCounter(),
                  ),
                  CupertinoButton(
                    child: Text('Power'),
                    onPressed: () => _powerCounter(),
                  ),
                  CupertinoButton(
                    child: Text('Root'),
                    onPressed: () => _rootCounter(),
                  ),
                ],
              ),

              SizedBox(height: 10,),

              CupertinoButton(
                    child: Text(
                      'Reset',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => _resetCounter(),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
