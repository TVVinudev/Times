import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class read extends StatefulWidget {
  const read({super.key});

  @override
  State<read> createState() => _readState();
}
final CollectionReference stu = FirebaseFirestore.instance.collection('time');

class _readState extends State<read> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD'),
        backgroundColor: Colors.lightGreen,
      ),
      body: StreamBuilder(
        stream: stu.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount:snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final DocumentSnapshot snap =snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 7,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title:Text(snap['name']),
                      subtitle:Text(snap['number'].toString()),
                      trailing: Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.edit),
                            Icon(Icons.delete)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.add),
      ),
    );
  }
}
