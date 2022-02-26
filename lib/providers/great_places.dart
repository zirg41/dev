import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/helpers/db_helper.dart';
import 'package:image_picker/image_picker.dart';
import '/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        image: pickedImage,
        location: null,
        title: pickedTitle);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert("places", {
      "id": newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            image: File(item['image']),
            location: null,
            title: item['title'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
