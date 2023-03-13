import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfrst/database.dart';
import 'package:flutterfrst/models.dart';

class AuthServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  logUser? _userfromfirebaseuser(User? user){//return the instance of the user not the whole detials
    return user !=null ? logUser(uid: user.uid) : null;
  }

  Stream<logUser?> get user{
    return _auth.authStateChanges().map((User? user) => _userfromfirebaseuser(user));
  }
  Future signInanon() async{
    try{
    UserCredential  result = await _auth.signInAnonymously();//sign -in anonymously
    User? user=result.user;
    return _userfromfirebaseuser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //Sign Out
Future SignOut() async{
    try{
      return await _auth.signOut();//sign out the user
    }catch(e){
      print(e.toString());//if any issues
      return null;
    }
}
  //register with email and password
Future registerwithemailpass(String email,String password) async{
    try{
      UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //create a new document for the user with the uid
      await DatabaseServices(uid: user!.uid).updateUserData('0', 'new crew member',100);//first time when no user is login
      return _userfromfirebaseuser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
}

//sign in with email and password
  Future Signinwithemailpass(String email,String password) async{
    try{
      UserCredential result= await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userfromfirebaseuser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}