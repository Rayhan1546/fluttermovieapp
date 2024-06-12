import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> createNewUser(
    String email,
    String password,
    String name,
  );
  Future<User?> loginWithEmailPassword(
    String email,
    String password,
  );
  Future<void> signout();
  Future<User?> signInWithGoogle();
}
