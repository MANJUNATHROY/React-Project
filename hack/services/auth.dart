import 'package:firebase_auth/firebase_auth.dart';
import 'package:hack/model/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;



GetUser? _userFromFirebase(User? user) {
    if (user != null) {
      return GetUser(uid: user.uid);
    } else {
      return null;
    }
  }

  //on Auth Change

  Stream<GetUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user));
  }

 //Register with email and password

 Future Registerwithemailpass(email, password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  //Sign In With Email and Password

  Future Signemailandpassword(email,password) async{
    try{

       UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

//Sign Out

 Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}