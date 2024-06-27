import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  //Attributes
  final FirebaseAuth _firebaseAuth;

  //Constructor
  AuthRepository(this._firebaseAuth);

  //Methods
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> signUpWithEmailAndPassword(String email, String pw) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: pw,
    );
  }

  Future<void> loginWithEmailAndPassword(String email, String pw) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: pw,
    );
  }

  Future<void> logOut() {
    return _firebaseAuth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  /// Return if a user is logged in or not.[User]
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}
