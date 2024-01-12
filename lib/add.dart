import 'package:flutter/material.dart';

class edit extends StatelessWidget {
  const edit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD'),
        backgroundColor: Colors.lightGreen,
      ),
      backgroundColor: Colors.white54,
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(),
                TextField()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
