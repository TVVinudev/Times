import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time/crud.dart';

class edit extends StatelessWidget {
   edit({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController number = TextEditingController();

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
                TextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: number,
                  keyboardType: TextInputType.number,
                ),
                MaterialButton(
                  onPressed: () {
                    add(name.text, number.text);
                    Navigator.of(context).pushNamed('home');
                  },
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.maxFinite,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightGreen,
                      ),
                      child: Center(child: Text('ADD')),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
