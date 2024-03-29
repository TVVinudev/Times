import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time/crud.dart';
import 'package:time/update.dart';

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
                final id = snap.id;
                print(id);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 7,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title:Text(snap['name']),
                      subtitle:Text(snap['number']),
                      trailing: Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> update(enableTextField: true, id: id, name: snap['name'], number: snap['number'])));
                          }, icon: Icon(Icons.edit)),
                            IconButton(onPressed: (){
                                      delete(id);
                            }, icon: Icon(Icons.delete))
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
          Navigator.of(context).pushNamed('edit');
        },
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.add),
      ),
    );
  }
}
