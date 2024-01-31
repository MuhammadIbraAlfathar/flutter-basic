import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? photo;
  final picker = ImagePicker();

  final GlobalKey _globalKey = GlobalKey();

  _saveLocalImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print(result);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("save successfuly to gallery")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Flutter Basic",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 3,
        backgroundColor: Colors.blue[800],
        actions: const [
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
          SizedBox(
            width: 16,
          ),
        ],
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RepaintBoundary(
                key: _globalKey,
                child: Container(
                  alignment: Alignment.center,
                  height: 300,
                  color: const Color.fromARGB(255, 175, 76, 76),
                  child: photo == null
                      ? const SizedBox()
                      : Image.file(File(photo!.path)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              _saveLocalImage();
            },
            child: const Text("Save To Gallery"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          photo = await picker.pickImage(source: ImageSource.camera);
          setState(() {});
        },
        backgroundColor: Colors.blue[800],
        child: const Icon(
          Icons.camera,
          color: Colors.white,
        ),
      ),
    );
  }
}
