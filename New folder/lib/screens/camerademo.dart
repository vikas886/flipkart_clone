
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraDemo extends StatefulWidget {
  CameraDemo({Key key}) : super(key: key);

  @override
  _CameraDemoState createState() => _CameraDemoState();
}

class _CameraDemoState extends State<CameraDemo> {
  File imageFile;
  _takePic() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile pickedFile =
        await imagePicker.getImage(source: ImageSource.camera);
    String filePath = pickedFile.path;
    setState(() {
      imageFile = new File(filePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CameraDemo"),
      ),
      body: Column(
        children: [
          Expanded(
            child: imageFile == null
                ? Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png')
                : Container(
                    child: Image.file(imageFile),
                  ),
          ),
          Divider(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {
              _takePic();
            },
            child: Text('Upload Product'),
          )
        ],
      ),
    );
  }
}
