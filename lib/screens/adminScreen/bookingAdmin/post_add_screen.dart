import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/house.dart';
import 'package:flutter_app_remote_stayhome/providers/home_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../theme/login_theme.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:image_picker_web/image_picker_web.dart';

class PostAddScren extends StatefulWidget {
  const PostAddScren({Key? key}) : super(key: key);

  @override
  State<PostAddScren> createState() => _PostAddScrenState();
}

class _PostAddScrenState extends State<PostAddScren> {
  late String _nameHouse;
  late String _adress;
  UploadTask? uploadTask;
  File? _pickerImage;
  Uint8List webImage = Uint8List(8);

  _pickImageTwo() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickerImage = selected;
        });
      } else {
        print("no image had  been picker");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickerImage = File.fromRawPath(webImage);
        });
      } else {
        print("no image had  been picker");
      }
    } else {
      print("no image had  been picker for web");
    }
  }

  Future<String> _uploadFile() async {
    final file;

    final path = "image/post/${DateTime.now().microsecondsSinceEpoch}";
    final ref = FirebaseStorage.instance.ref().child(path);
    try {
      if (!kIsWeb) {
        uploadTask = ref.putFile(_pickerImage!);
      } else {
        uploadTask =
            ref.putData(webImage, SettableMetadata(contentType: 'image/png'));
      }
    } on FirebaseException catch (e) {
      print("Failed with error '${e.code}': ${e.message}");
    }

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownLoad = await snapshot.ref.getDownloadURL();
    if (kDebugMode) {
      print("url download: $urlDownLoad");
    }

    // uploadTask = null;
    return "$urlDownLoad";
  }

  Image getImagePicker() {
    Image image = kIsWeb
        ? Image.memory(
            webImage,
            fit: BoxFit.fill,
          )
        : Image.file(_pickerImage!, fit: BoxFit.fill);

    return image;
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    _addHouse(String name, String address) async {
      String url = await _uploadFile();
      House house = House(name: name, address: address, idImage: url);
      await homeProvider.addHouse(house);
      
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add post"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: const Text(
              'Name House',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
              child: SizedBox(
            width: 310,
            child: TextFormField(
              onChanged: (value) {
                _nameHouse = value;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter name house',
                hintStyle: TextStyle(color: LoginTheme.hintText),
              ),
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: const Text(
              'Adress',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
              child: SizedBox(
            width: 310,
            child: TextFormField(
              onChanged: (value) {
                _adress = value;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter name house',
                hintStyle: TextStyle(color: LoginTheme.hintText),
              ),
            ),
          )),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                MaterialButton(
                    color: Colors.blue,
                    child: const Text("Pick Image from Gallery",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      _pickImageTwo();
                    }),
                SizedBox(
                  height: 20,
                ),
                Container(
                    child: _pickerImage == null
                        ? Text("hihihi")
                        : getImagePicker()),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    color: Colors.blue,
                    child: const Text("upload image",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      // House house = House(name: _nameHouse, address: _adress);
                      _addHouse(_nameHouse, _adress);
                    }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
