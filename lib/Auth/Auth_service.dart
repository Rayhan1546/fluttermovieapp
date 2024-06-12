import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static AuthService? authService;

  static AuthService getInstance() {
    authService ??= AuthService();
    return authService!;
  }

  final _auth = FirebaseAuth.instance;

  Future<User?> createNewUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user; // Return the User object
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User?> loginWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  Future<void> signout() async {
    try {
      print('sign out');
      await _auth.signOut();
    } catch (e) {
      print("Signout Error: $e");
    }
  }
}
