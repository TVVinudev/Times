import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time/add.dart';

class update extends StatelessWidget {
  final String id;
  update({super.key, required this.id});

  final TextEditingController updateName = TextEditingController();
  final TextEditingController updateNumber = TextEditingController();

  Update(String _name,String _number) async{
   final result = await FirebaseFirestore.instance.collection('time').doc(id).update({
      'name':_name,
      'number':_number,
    });
  }

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
                  controller: updateName,
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: updateNumber,
                  keyboardType: TextInputType.number,
                ),
                MaterialButton(
                  onPressed: () {
                  Update(updateName.text, updateNumber.text);
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
                      child: Center(child: Text('update')),
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
