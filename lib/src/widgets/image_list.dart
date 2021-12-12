import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  Widget buildImage(ImageModel image) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.blueGrey),
      ),
      child: Column(
        children: <Widget>[
          Padding(
              child: Image.network(image.url),
              padding: const EdgeInsets.only(bottom: 10.0)),
          Text(image.title)
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemCount: images.length,
        itemBuilder: (context, int index) {
          return buildImage(images[index]);
        });
  }
}
