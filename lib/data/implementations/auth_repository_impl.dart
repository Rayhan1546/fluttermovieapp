import 'package:firebase_auth/firebase_auth.dart';
import 'package:mymovieapp/Auth/Auth_service.dart';
import 'package:mymovieapp/data/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthService _authService = AuthService.getInstance();

  @override
  Future<User?> createNewUser(String email, String password, String name) async {
    return await _authService.createNewUser(email, password, name);
  }

  @override
  Future<User?> loginWithEmailPassword(String email, String password) async {
    return await _authService.loginWithEmailPassword(email, password);
  }

  @override
  Future<void> signout() async {
    _authService.signout();
  }

  @override
  Future<User?> signInWithGoogle() async {
    return await _authService.signInWithGoogle();
  }
}
