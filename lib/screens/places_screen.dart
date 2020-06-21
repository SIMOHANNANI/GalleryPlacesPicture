import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import './add_place_screen.dart';
import '../providers/places.dart';

class PlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery of my places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).fetchPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
              child: SizedBox(
                  width: 150.0,
                  height: 150.0,
                    child: CircularProgressIndicator(),
                ),
            )
            : Consumer<Places>(
                child: Center(
                  child: Text('..... ....All places.... .....'),
                ),
                builder: (ctx, places, staticChild) => places.places.length <= 0
                    ? staticChild
                    : ListView.builder(
                        itemCount: places.places.length,
                        itemBuilder: (ctx, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              places.places[index].image,
                            ),
                          ),
                          title: Text(places.places[index].title),
                          subtitle:
                              Text(places.places[index].location.toString()),
                        ),
                      ),
              ),
      ),
    );
  }
}
//Center(child: SizedBox(width:100.0,height: 100.0,child: CircularProgressIndicator()),),
