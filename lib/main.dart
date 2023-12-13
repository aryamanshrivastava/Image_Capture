// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ImagePicker imagePicker = ImagePicker();
  File? image;
  chooseImages() async {
    final XFile? file =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        image = File(file.path);
      });
    }
  }

  captureImages() async {
    final XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
    if (file != null) {
      setState(() {
        image = File(file.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image != null
                ? Image.file(
                    image!,
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                  )
                : Icon(Icons.image, size: 150),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  chooseImages();
                },
                onLongPress: () {
                  captureImages();
                },
                child: Text(
                  'Choose/Capture',
                ))
          ],
        ),
      ),
    );
  }
}
