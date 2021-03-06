import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' as image_picker;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class ImagePicker extends StatefulWidget {
  _ImagePickerState createState() => _ImagePickerState();
  final Function _onSelectImage;

  ImagePicker(this._onSelectImage);
}

class _ImagePickerState extends State<ImagePicker> {
  File _storedImage;

  Future _takeImage() async {
      final eFile = await image_picker.ImagePicker().getImage(
        source: image_picker.ImageSource.camera,
        maxWidth: 600.0,
        maxHeight: 600.0,
      );
      if (eFile == null ) {
        return;
      }
        setState(() {
          _storedImage = File(eFile.path);
        });
        Directory appDirectory =
            await path_provider.getApplicationDocumentsDirectory();
        final fileName = path.basename(eFile.path);
        final savedImage = await _storedImage.copy('${appDirectory.path}/$fileName');
        widget._onSelectImage(savedImage);


  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          image: _storedImage != null ? DecorationImage(image:AssetImage(_storedImage.path),fit: BoxFit.fill) : null,
          border: Border.fromBorderSide(
            BorderSide(width: 2, color:  Theme.of(context).primaryColorLight),
          ),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: _storedImage != null
            ? Container(child:Text(''))
            : Text(
                'choose an image',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: FlatButton.icon(
          onPressed: () => _takeImage(),
          icon: Icon(
            Icons.camera_alt,
            color: Theme.of(context).primaryColorDark,
          ),
          label: Text(
            'choose an image',
            style: TextStyle(color: Colors.indigoAccent, fontSize: 20.0),
          ),
//          textColor: Colors.red,
//          color: Colors.indigoAccent,
        ),
      ),
    ]);
  }
}
