import 'package:flutter/material.dart';

class NavigatingScreen extends StatelessWidget {
  const NavigatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('News'),
      ),
      body: ListTile(
        subtitle: Text(''),
      ),
    );
  }
}
