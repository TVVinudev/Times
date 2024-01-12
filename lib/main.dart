import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final CollectionReference stu =FirebaseFirestore.instance.collection('time');
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder(
          stream: stu.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) { 
            if(snapshot.hasData){
              return ListView.builder(
                itemCount:snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) { 
                  final DocumentSnapshot snap =snapshot.data!.docs[index];
                  return Column(
                    children: [
                      Text(snap['name']),
                      Text(snap['number'].toString())
                    ],
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
          
        ),
      ),
    );
  }
}

