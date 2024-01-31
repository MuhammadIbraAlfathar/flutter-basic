import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
                "https://img.freepik.com/free-photo/coffee-mug-table-with-cookies-plate-spoon_23-2148808591.jpg?w=740&t=st=1706687559~exp=1706688159~hmac=e38b04e299dd8e863dbad1d66e328d9510e31de182febbee4ffa51bfb191a932"),
          ),
          // Image.asset("assets/images/img1.jpg"),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://img.freepik.com/free-photo/coffee-mug-table-with-cookies-plate-spoon_23-2148808591.jpg?w=740&t=st=1706687559~exp=1706688159~hmac=e38b04e299dd8e863dbad1d66e328d9510e31de182febbee4ffa51bfb191a932"),
          )
        ],
      ),
    );
  }
}
