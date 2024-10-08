import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_clone/data/models/auth/user.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserReq signinUserReq);

  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return const Right('User signed in successfully');
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred';
      if (e.code == 'invalid-email') {
        message = 'The email address is badly formatted';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong email or password';
      }
      return Left(message);
    } catch (e) {
      debugPrint(e.toString());
      return const Left('An error occurred while creating user');
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(data.user!.uid)
          .set({
        'email': createUserReq.email,
        'name': createUserReq.fullName,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'profilePic': '',
        'favoriteSongs': [],
        'favoriteArtists': [],
        'favoriteAlbums': [],
        'ownedPlaylists': [],
        'listeningHistory': [],
      });

      return const Right('User created successfully');
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email';
      }
      return Left(message);
    } catch (e) {
      debugPrint(e.toString());
      return const Left('An error occurred while creating user');
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      final user = await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser!.uid)
          .get();
      UserModel userModel = UserModel.fromJson(user.data()!);
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      debugPrint(e.toString());
      return Left('An error occurred while getting user');
    }
  }
}
