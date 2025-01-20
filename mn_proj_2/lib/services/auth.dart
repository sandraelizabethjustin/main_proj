import 'package:mn_proj_2/models/myuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mn_proj_2/services/database.dart';

class AuthService{
  //final means not going to change in future
  //this instance helps us to communicate with firebase backend
  final FirebaseAuth _auth=FirebaseAuth.instance;//_auth it is private.it can only be used in this file and not in another file.
  //sign in anonymously may result in error


  //to include admin also
  //final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //create MyUser obj(user) based on User
  MyUser? _userFromCredUser(User? user){
    return user != null ? MyUser(uid: user.uid) : null;
  }
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromCredUser(user));
  }


   //sign in with email and password-p13
  Future signInWithEmailAndPassword(String email,String password) async{
    try {
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      return _userFromCredUser(user);
    } catch (e) {//if things in try block is unsuccessful
      print(e.toString());
      return null;
    }
  }

  //register with email and password-p12
  Future registerWithEmailAndPassword(String email,String password, String isAdmin) async{
    try {
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      await DatabaseService(uid: user!.uid).updateUserData(isAdmin,email,password);
      return _userFromCredUser(user);
    } catch (e) {//if things in try block is unsuccessful
      print(e.toString());
      return null;
    }
  }


  //sign out p9
  Future signOut() async{//this signOut need not be same wiyh thst of line 65
    try{
      return await _auth.signOut();//in built of firebase
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}







  //part7 start
  // auth change user stream
  //Firebase User is now User?
  //onAuthStateChanged is now authStateChanges()
  
  // Stream<MyUser?> get user {
  //   //return _auth.authStateChanges().map((User? user) => _userFromCredUser(user));//for user only
  //   return _auth.authStateChanges().asyncMap((User? user) async {//for admin+user 
  //     if (user != null) {
  //       // Fetch isAdmin from Firestore
  //       final doc = await _firestore.collection('users').doc(user.uid).get();
  //       final isAdmin = doc.data()?['isAdmin'] ?? false;
  //       return _userFromCredUser(user, isAdmin);
  //     }
  //     return null;
  //   });
  // }
  //p7 end

  /*Future signInAnon() async{
    try {//AuthResult(old version) is now renamed to UserCredential;FirebaseUser is renamed to User?.
      UserCredential result=await _auth.signInAnonymously();
      User? user= result.user;
      return _userFromCredUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  } */ 

/*

  //sign in with email and password-p13
  Future signInWithEmailAndPassword(String email,String password) async{
    try {
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      return _userFromCredUser(user);
    } catch (e) {//if things in try block is unsuccessful
      print(e.toString());
      return null;
    }
  }

  //register with email and password-p12
  Future registerWithEmailAndPassword(String email,String password, String isAdmin) async{
    try {
      UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      await DatabaseService(uid: user!.uid).updateUserData(isAdmin,email,password);
      return _userFromCredUser(user);
    } catch (e) {//if things in try block is unsuccessful
      print(e.toString());
      return null;
    }
  }


  //sign out p9
  Future signOut() async{//this signOut need not be same wiyh thst of line 65
    try{
      return await _auth.signOut();//in built of firebase
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}
*/