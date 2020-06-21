import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';
import '../helpers/db.dart';

class Places extends ChangeNotifier {
  // list of the place available
  List<Place> _places = [];

  // getting a copy of the places
  List<Place> get places {
    return [..._places];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toIso8601String(),
      title: title,
      image: image,
      location: null,
    );
    _places.add(newPlace);
    notifyListeners();
    DataBase.insert('gallery', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchPlaces() async {
    final placesList = await DataBase.fetch('gallery');
    _places = placesList
        .map((e) => Place(
              id: e['id'],
              title: e['title'],
              location: null,
              image: File(e['image']),
            ))
        .toList();
    notifyListeners();
  }
}
