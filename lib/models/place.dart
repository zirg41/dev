import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place({
    @required this.id,
    @required this.image,
    @required this.location,
    @required this.title,
  });
}

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String addres;

  PlaceLocation({
    @required this.addres,
    @required this.latitude,
    @required this.longitude,
  });
}
