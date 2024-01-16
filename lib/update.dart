
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time/add.dart';
import 'package:time/crud.dart';

class update extends StatelessWidget {
  final String id;
  final String name;
  final String number;
  final bool enableTextField;
  update({super.key, required this.id, required this.name, required this.number,required this.enableTextField});

  final TextEditingController updateName = TextEditingController();
  final TextEditingController updateNumber = TextEditingController();


  @override
  Widget build(BuildContext context) {
    enableTextField? WidgetsBinding.instance.addPostFrameCallback((_) {
      updateName.text=name;
      updateNumber.text = number;
    }):null;
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
                TextFormField(
                  enabled: enableTextField,
                  controller: updateName,
                  keyboardType: TextInputType.text,

                ),
                TextFormField(
                  enabled: enableTextField,
                  controller: updateNumber,
                  keyboardType: TextInputType.number,

                ),
                MaterialButton(
                  onPressed: () {
                  Update(updateName.text, updateNumber.text,id);
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
