import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.push("/firestore");
              },
              child: const Text("Test Firestore"),
            ),
            ElevatedButton(
              onPressed: () {
                context.push("/provider");
              },
              child: const Text("Test Provider"),
            ),
          ],
        ),
      ),
    );
  }
}
