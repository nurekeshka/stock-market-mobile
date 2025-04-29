import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Hello Worlds!"),
        subtitle: Text("I mean really, hello world!"),
      ),
    );
  }
}
