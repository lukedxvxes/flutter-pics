import 'package:flutter/material.dart';

class App extends StatefulWidget{
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}


class _AppState extends State<App> {
  
  int _counter = 0;

  void _increment(){
    setState((){
      _counter++; 
    });
  }

  void _clearCounter(){
    setState((){
      _counter = 0;
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get Pix'),
        ),

        body: Text(
            'Images displayed $_counter',
            style: const TextStyle(fontSize: 24),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: _increment,
          tooltip: 'Increment Counter',
          child: const Icon(Icons.filter_list),
        ),

      ),
    );
  }
}