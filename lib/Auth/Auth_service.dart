import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static AuthService? authService;

  static AuthService getInstance() {
    authService ??= AuthService();
    return authService!;
  }

  final _auth = FirebaseAuth.instance;

  Future<User?> createNewUser(
      String email, String password, String name) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(name);

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

  Future<User?> loginWithEmailPassword(String email, String password) async {
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

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        return authResult.user;
      }
    } catch (error) {
      print("Error signing in with Google: $error");
    }
    return null;
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
