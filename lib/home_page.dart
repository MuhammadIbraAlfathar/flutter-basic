import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  XFile? photo;
  final picker = ImagePicker();

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
      body: Center(
        child: Container(
          height: 300,
          color: const Color.fromARGB(255, 175, 76, 76),
          child:
              photo == null ? const SizedBox() : Image.file(File(photo!.path)),
        ),
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
