import 'package:flutter/material.dart';

class LayoutExample extends StatefulWidget {
  const LayoutExample({super.key});

  @override
  State<LayoutExample> createState() => _LayoutExample();
}

class _LayoutExample extends State<LayoutExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 40,
                color: Colors.blue,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 20));
  }
}
