import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static User? currentUser = _auth.currentUser;

  static Future<User> loginAdmin(String email,String password) async{
   final credential= await _auth.signInWithEmailAndPassword(email: email, password: password);
   return credential.user!;
  }
static Future<User?>logout() async {
   await _auth.signOut();

}
}
