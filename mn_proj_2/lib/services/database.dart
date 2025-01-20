import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference userCollection=FirebaseFirestore.instance.collection('users');
  //reference to that collection is userCollection

  Future updateUserData(String isAdmin,String email,String password) async{
    return await userCollection.doc(uid).set({
      'isAdmin':isAdmin,
      'email':email,
      'password':password,
      //'strength':strength,
    });
  }
}