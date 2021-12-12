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
          Text('@' + image.username)
        ],
      ),
    );
  }

  @override
  Widget build(context) {
    var reversedImageList = List.from(images.reversed);

    return ListView.builder(
        shrinkWrap: true,
        reverse: true,
        padding: const EdgeInsets.all(10),
        itemCount: images.length,
        itemBuilder: (context, int index) {
          return buildImage(reversedImageList[index]);
        });
  }
}
