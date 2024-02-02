import 'package:flutter/material.dart';

import 'navigation_pop.dart';

class NavigationPushWidget extends StatefulWidget {
  const NavigationPushWidget({super.key});

  @override
  State<NavigationPushWidget> createState() => _NavigationPushWidgetState();
}

class _NavigationPushWidgetState extends State<NavigationPushWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter - Navigation Pop"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const NavigationPopWidget();
                }));
              },
              child: const Text("Go to the next page)"),
            )
          ],
        ),
      ),
    );
  }
}
