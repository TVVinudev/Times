import 'package:cloud_firestore/cloud_firestore.dart';

delete(String id) async {
  await FirebaseFirestore.instance.collection('time').doc(id).delete();
}