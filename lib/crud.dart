import 'package:cloud_firestore/cloud_firestore.dart';

delete(String id) async {
  await FirebaseFirestore.instance.collection('time').doc(id).delete();
}

Update(String _name,String _number,String id) async{
  final result = await FirebaseFirestore.instance.collection('time').doc(id).update({
    'name':_name,
    'number':_number,
  });
}