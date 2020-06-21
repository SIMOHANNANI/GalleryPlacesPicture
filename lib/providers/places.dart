import 'dart:io';

import 'package:flutter/foundation.dart';
import '../models/place.dart';

class Places extends ChangeNotifier {
  // list of the place available
  List<Place> _places = [];

  // getting a copy of the places
  List<Place> get places {
    return [..._places];
  }
  void addPlace(String title, File image){
    final newPlace = Place(
      id:DateTime.now().toIso8601String(),
      title: title,
      image: image,
      location: null,
    );
    _places.add(newPlace);
    notifyListeners();

  }

}
