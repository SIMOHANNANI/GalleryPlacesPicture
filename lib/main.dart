import 'package:flutter/material.dart';
import './screens/places_screen.dart';
import 'package:provider/provider.dart';
import './providers/places.dart';
import 'screens/add_place_screen.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Places(),
      child: MaterialApp(
        title: 'GalleryApp',
        theme: ThemeData(
          primaryColor: Colors.orangeAccent,
          accentColor: Colors.red
        ),
        home: PlacesScreen(),
        routes: {
           AddPlaceScreen.routeName :(ctx)=>AddPlaceScreen()
        },
      ),
    );
  }
}