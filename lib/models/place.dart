import 'package:flutter/foundation.dart';
import 'dart:io';

class PlaceLocation {
  // the longitude of the place
  final double longitude;

  // the latitude of the place
  final double latitude;

  // the address of the place
  final String address;

  PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    @required this.address,
  });
}

class Place {
  // the id of the place
  final String id;

  // the place title
  final String title;

  // the geolocation of the place
  final Map<double, double> location;

  // the image of the place
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
