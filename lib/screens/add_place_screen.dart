import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import '../widgets/image_picker.dart';
import '../widgets/location_picker.dart';
import '../providers/places.dart';
class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/addPlace';

  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;
  void _tokenImage(File pickedImage ){
    _pickedImage = pickedImage;
  }
  void _addPlaceFormSubmitting(){
    // if the title was empty when the add place button triggered :
    if(_titleController.text.isEmpty || _pickedImage == null) return;
    Provider.of<Places>(context,listen: false).addPlace(_titleController.text,_pickedImage);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding a new place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'place title',
                      ),
                    ),
                    SizedBox(height: 60.0,),
                    ImagePicker(_tokenImage),
                    SizedBox(height: 40.0,),
                    LocationPicker(),
                  ],
                ),
              ),
            ),
          ),

          RaisedButton.icon(
            color: Theme
                .of(context)
                .primaryColorLight,
            icon: Icon(Icons.add),
            label: Text('Add place'),
            onPressed: _addPlaceFormSubmitting,
            elevation: 0.0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}
