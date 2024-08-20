import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageUpload extends StatefulWidget {
  String? userId;
  ImageUpload({super.key, this.userId});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File? _image;
  final imagePicker = ImagePicker();
  String? downloadURL;

  Future imagePickerMethod() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar("no file selected", Duration(milliseconds: 400));
      }
    });
  }

  Future uploadImage() async {
    final postID = DateTime.now().microsecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${widget.userId}images")
        .child("post_$postID");

    await ref.putFile(_image!);
    downloadURL = await ref.getDownloadURL();
    print(downloadURL);
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            height: 550,
            width: double.infinity,
            child: Column(
              children: [
                const Text('upload img'),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.red),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: _image == null
                                    ? const Center(
                                        child: Text("no image"),
                                      )
                                    : Image.file(_image!)),
                            ElevatedButton(
                                onPressed: () {
                                  imagePickerMethod();
                                },
                                child: Text("select image")),
                            ElevatedButton(
                                onPressed: () {
                                  uploadImage();
                                },
                                child: Text("upload image")),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
