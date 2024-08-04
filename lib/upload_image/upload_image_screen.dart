import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


class UploadImageScreen extends StatefulWidget {
  static const String routeName = "Upload-Image-Screen";
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Future<void> _uploadImage() async {
  //   if (_image == null) return;

  //   final request = http.MultipartRequest('POST', Uri.parse('http://your-app-url/api/upload-image'));
  //   request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

  //   final response = await request.send();

  //   if (response.statusCode == 201) {
  //     final responseBody = await http.Response.fromStream(response);
  //     final responseData = jsonDecode(responseBody.body);
  //     print('Uploaded image path: ${responseData['path']}');
  //   } else {
  //     print('Failed to upload image');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
