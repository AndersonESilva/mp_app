import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mp_app/data/model/user.dart';
import 'package:mp_app/service/main_service.dart';
import 'package:mp_app/service/user_service.dart';

class UserRepository{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserService _userService = UserService();

  Future<User> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    final User _user = await getUserEmail(user.email);
    return _user;
  }

  Future<User> createUser(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    final User _user = await _userService.createUser(User("", user.displayName, user.email, user.photoUrl, user.uid, "", "firebase"));
    return _user;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<User> signWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email']
    );

    final GoogleSignInAccount account = await _googleSignIn.signIn();
    if(account.id != null){
      final GoogleSignInAuthentication authentication = await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken
      );

      final FirebaseUser user =
          (await _firebaseAuth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);

      return User("", user.displayName, user.email, user.photoUrl, user.uid, "", "google");
    } else{
      return null;
    }
  }

  Future<User> signWithFacebook() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logIn(['email']);

    debugPrint(result.status.toString());

    if (result.status == FacebookLoginStatus.loggedIn) {
      final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token
      );

      final FirebaseUser user =
          (await _firebaseAuth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);

      return User("", user.displayName, user.email, user.photoUrl, user.uid, "", "facebook");
    }

    return null;
  }

  Future<User> getUserEmail(String email) async{
    var user = await _userService.getUserEmail(email);
    return user;
  }

}
