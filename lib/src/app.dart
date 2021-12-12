import 'package:flutter/material.dart';
import 'package:http/http.dart' as http show get;
import 'dart:convert';
import './models/image_model.dart';
import './widgets/image_list.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _counter = 1;
  List<ImageModel> images = [];

  Future _fetchImage() async {
    setState(() {
      _counter++;
    });

    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$_counter'));

    if (response.statusCode == 200) {
      final imageModel = ImageModel.fromJson(json.decode(response.body));
      setState(() {
        images.add(imageModel);
      });
    } else {
      throw Exception('Failed to load picture');
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get Pix'),
        ),
        body: _counter > 0
            ? ImageList(images)
            : const Center(child: Text('No Pics')),
        floatingActionButton: FloatingActionButton(
          onPressed: _fetchImage,
          tooltip: 'Increment Counter',
          child: const Icon(Icons.filter_list),
        ),
      ),
    );
  }
}
