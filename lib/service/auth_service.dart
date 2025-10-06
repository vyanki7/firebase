import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// 🔹 Signup with Email & Password
  Future<String?> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message; // Firebase error
    } catch (e) {
      return "Something went wrong. Try again!";
    }
  }

  /// 🔹 Signin with Email & Password
  Future<String?> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Success
    } on FirebaseAuthException catch (e) {
      return e.message; // Firebase error
    } catch (e) {
      return "Something went wrong. Try again!";
    }
  }

  /// 🔹 Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// 🔹 Get current logged in user (if needed)
  User? get currentUser => _auth.currentUser;

  /// 🔹 Stream to listen authentication state (login/logout)
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}
