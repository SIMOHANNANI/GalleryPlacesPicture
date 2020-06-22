import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationPicker extends StatefulWidget {
  _LocationPicker createState() => _LocationPicker();
}

class _LocationPicker extends State<LocationPicker> {
  String urlPreview;

  @override
  Widget build(BuildContext context) {
    Future<void> _getCurrentUserLocation() async{
      final locationData = await Location().getLocation();
      print(locationData.longitude);
      print(locationData.latitude);


    }
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.fromBorderSide(
              BorderSide(width: 2, color: Colors.grey),
            ),
          ),
          height: 400.0,
          width: double.infinity,
          child: urlPreview == null
              ? Center(
                  child: Text(
                    'No location choosen yet',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Image.network(
                  urlPreview,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: FlatButton.icon(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black38,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                _getCurrentUserLocation();
              },
              color: Colors.lightGreenAccent,
              icon: Icon(Icons.location_on),
              label: Text('current location'),
            )),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
                child: FlatButton.icon(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black38,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {},
              icon: Icon(Icons.map),
              label: Text('select location'),
              color: Colors.lightBlueAccent,
            )),
          ],
        )
      ],
    );
  }
}
