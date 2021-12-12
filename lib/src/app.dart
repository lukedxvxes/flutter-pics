import 'package:flutter/material.dart';
import 'package:http/http.dart' as http show get;
import 'dart:convert';
import './models/image_model.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _counter = 1;

  Future _fetchImage() async {
    setState(() {
      _counter++;
    });

    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$_counter'));

    if (response.statusCode == 200) {
      var image = ImageModel.fromJson(json.decode(response.body));
      print(image.url);
      return image;
    } else {
      throw Exception('Failed to load album');
    }
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
          onPressed: _fetchImage,
          tooltip: 'Increment Counter',
          child: const Icon(Icons.filter_list),
        ),
      ),
    );
  }
}
