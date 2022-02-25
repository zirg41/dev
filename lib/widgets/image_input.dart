import 'dart:io' as io;

import 'package:flutter/material.dart';

class ImageInput extends StatelessWidget {
  const ImageInput();

  @override
  Widget build(BuildContext context) {
    io.File _storedImage;

    return Row(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  "No image taken",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text("Take picture"),
            textColor: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
