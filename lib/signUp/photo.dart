import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(AddPhoto());
}

///앱 메인 페이지
class AddPhoto extends StatefulWidget {
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  File? userImage;

  @override
  Widget build(BuildContext context) {
    /** Widget
     * 1. MaterialApp : google style, custom 가능
     */
    /**
     * Scaffold : 앱을 상중하로 나눠줌
     */
    /**
     * Row : 가로로 배열
     */
    // return MaterialApp(
    //     home: Center(
    //         child: Container(
    //   width: 50,
    //   height: 100,
    //   color: Colors.blue,
    // )));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title:
                  const Text('versus', style: TextStyle(color: Colors.black)),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Align(
              alignment: Alignment.center,
              child: Container(
                  child: Column(
                children: [
                  userImage != null ? Image.file(userImage!) : Text('이미지를 업로드 해주세요'),
                  ElevatedButton(
                      onPressed: () async {
                        var picker = ImagePicker();
                        var image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          print('upload image : ' + image.toString());
                          setState(() {
                            userImage = File(image.path);
                          });
                        }
                      },
                      child: null)
                ],
              )),
            ),
            bottomNavigationBar: BottomAppBar(
              child: SizedBox(
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              print("afsd");
                            },
                            child: Icon(Icons.phone)),
                        TextButton(
                            onPressed: () {
                              print("afsd");
                            },
                            child: Icon(Icons.message)),
                        TextButton(
                            onPressed: () {
                              print("afsd");
                            },
                            child: Icon(Icons.contact_page)),
                      ])),
            )));
  }
}
