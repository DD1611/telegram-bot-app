import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import '../models/user_details.dart';

class AuthService {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  AuthService({
    FirebaseAuth? auth,
    GoogleSignIn? googleSignIn,
    FacebookAuth? facebookAuth,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ??
            GoogleSignIn(
              scopes: [
                'email',
                'profile',
              ],
            ),
        _facebookAuth = facebookAuth ?? FacebookAuth.instance;

  Future<PigeonUserDetails> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw Exception('Google sign in was cancelled');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the credential
      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        throw Exception('Failed to sign in with Google');
      }

      // Create and return user details
      return PigeonUserDetails(
        id: user.uid,
        email: user.email ?? googleUser.email,
        displayName: user.displayName ?? googleUser.displayName ?? '',
        photoUrl: user.photoURL ?? googleUser.photoUrl ?? '',
      );
    } catch (e) {
      throw Exception('Failed to sign in with Google: $e');
    }
  }

  Future<PigeonUserDetails> signInWithFacebook() async {
    try {
      final LoginResult result = await _facebookAuth.login();
      if (result.status != LoginStatus.success) {
        throw Exception('Facebook sign in was cancelled');
      }

      // Get the access token
      final accessToken = result.accessToken!;

      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);

      // Sign in to Firebase with the Facebook auth credential
      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        throw Exception('Failed to sign in with Facebook');
      }

      // Get additional user information from Facebook
      final userData = await _facebookAuth.getUserData();

      return PigeonUserDetails(
        id: user.uid,
        email: user.email ?? userData['email'] ?? '',
        displayName: user.displayName ?? userData['name'] ?? '',
        photoUrl: user.photoURL ?? userData['picture']['data']['url'] ?? '',
      );
    } catch (e) {
      throw Exception('Failed to sign in with Facebook: $e');
    }
  }

  Future<void> signOut() async {
    try {
      // First sign out from Firebase
      await _auth.signOut();

      // Try to sign out from Google if signed in
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }

      // Try to sign out from Facebook if possible
      try {
        final accessToken = await _facebookAuth.accessToken;
        if (accessToken != null) {
          await _facebookAuth.logOut();
        }
      } catch (e) {
        // Ignore Facebook logout errors
        print('Facebook logout error: $e');
      }
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  PigeonUserDetails? getCurrentUser() {
    final user = _auth.currentUser;
    if (user == null) {
      return null;
    }

    return PigeonUserDetails(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
      photoUrl: user.photoURL ?? '',
    );
  }

  Future<PigeonUserDetails> signInWithEmail(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw Exception('Failed to sign in with email/password');
      }

      return PigeonUserDetails(
        id: user.uid,
        email: user.email ?? '',
        displayName: user.displayName ?? '',
        photoUrl: user.photoURL ?? '',
      );
    } catch (e) {
      throw Exception('Failed to sign in with email/password: $e');
    }
  }

  Future<PigeonUserDetails> registerWithEmail(
    String email,
    String password,
    String name,
  ) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user == null) {
        throw Exception('Failed to register with email/password');
      }

      // Update the user's display name
      await user.updateDisplayName(name);

      return PigeonUserDetails(
        id: user.uid,
        email: user.email ?? '',
        displayName: name,
        photoUrl: user.photoURL ?? '',
      );
    } catch (e) {
      throw Exception('Failed to register with email/password: $e');
    }
  }
}
