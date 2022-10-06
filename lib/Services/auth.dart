import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_salerno/Beans/Utente.dart';
import 'package:firebase_auth/firebase_auth.dart';



class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;


  //create user object from Firebase
  Utente? _userFromFirebaseUser(User? user) {
    return user != null ? Utente(uid: user.uid) : Utente(uid: '');
  }

  //auth change user stream
  Stream<Utente> get user {
    return _auth.authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!)!);
  }

  // sign in anonimus
 Future signInAnon() async{
   try {
     UserCredential result = await _auth.signInAnonymously();
     User? user = result.user;
     return _userFromFirebaseUser(user);
   } catch(e){
      print(e.toString());
      return null;
   }
 }

  // sign in with email and password
  Future singInWithEmailAndPassword(String email, String pass) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User? user = result.user;
      print('Accesso effettuato con :'+user.toString());
      return _userFromFirebaseUser(user);
    }catch (e){
      print(e);
      return null;
    }
  }


  //register with email and passowrd

  // sing out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch (e){
        print(e.toString());
        return null;
    }
  }

}