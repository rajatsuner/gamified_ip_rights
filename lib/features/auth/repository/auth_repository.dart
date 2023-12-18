import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamified_ip_rights/common/providers/firebase_providers.dart';
import 'package:gamified_ip_rights/common/repository/api_repo.dart';
import 'package:gamified_ip_rights/features/auth/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

final authRepositoryProvider = Provider((ref) => AuthRepository(
    googleSignIn: ref.read(googleSignInProvider),
    apiRepo: ref.read(apiRepoProvider),
    auth: ref.read(authProvider)));

class AuthRepository {
  GoogleSignIn _googleSignIn;
  FirebaseAuth _auth;
  ApiRepo _apiRepo;

  AuthRepository(
      {required GoogleSignIn googleSignIn,
      required ApiRepo apiRepo,
      required FirebaseAuth auth})
      : _auth = auth,
        _apiRepo = apiRepo,
        _googleSignIn = googleSignIn;

  //try to sign in with google
  Future<(UserModel?, bool)> signInWithGoogle() async {
    UserModel? userModel;
    try {
      UserCredential userCredential;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      if (googleAuth == null) return (null, false);

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userCredential = await _auth.signInWithCredential(credential);

      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            userId: userCredential.user!.uid,
            userName: userCredential.user!.displayName,
            email: userCredential.user!.email);
        return (userModel, true);
      } else {
        return await getUserData(userCredential.user!.uid);
      }
    } catch (e) {
      return (null, false);
    }
  }

  //get User Data
  Future<(UserModel?, bool)> getUserData(String uid) async {
    debugPrint("GETTING USER DATA");
    UserModel? userModel;
    String userId = uid;
    try {
      print("TRY get  USER DATA $uid");
      final response = await _apiRepo.getUserInfo(userId);
      print("After response ${response.data}");
      if (response.statusCode == 200) {
        //user info found
        debugPrint("USER INFO FOUND");
        Map<String, dynamic> map = response.data;

        print("object data $map");
        print("obj : ${map["UserInfo"]}");

        userModel = UserModel.fromMap(map["UserInfo"]);
        print(userModel);
        return (userModel, false);
      } else if (response.statusCode == 404) {
        //user info not found in DB
        debugPrint("USER INFO NOT FOUND");
        return (null, true);
      }
    } catch (e) {
      return (null, false);
    }
    return (null, false);
  }

  //put user data or register user
  Future<bool> registerUser(UserModel userModel) async {
    try {
      final response = await _apiRepo.registerUser(userModel);
      if (response.statusCode == 201) {
        //user register successfully
        return true;
      } else {
        print("ERROR code : ${response.statusCode}");
      }
    } on Exception catch (e) {}
    return false;
  }

  //Check whether user is already signed in or not
  Future<bool> isUserAlreadySignedIn() {
    return _googleSignIn.isSignedIn();
  }

  //Sign our user from the device
  void logOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
