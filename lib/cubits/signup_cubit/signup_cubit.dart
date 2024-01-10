import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_training/cubits/signup_cubit/signup_states.dart';
import 'package:firebase_training/main.dart';
import 'package:firebase_training/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) {
    return BlocProvider.of(context);
  }

  // LoginModel? loginModel;

  void userSignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      //print token

      print(value.user!.email);
      print(value.user!.uid);
      mybox!.put('uId', value.user!.uid);
      // call userCreate method and pass to it the parameters
      userCreate(name: name, email: email, uId: value.user!.uid, phone: phone);
      emit(SignUpSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SignUpErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String uId,
    required String phone,
  }) {
    UserModel model =
        UserModel(email: email, name: name, uId: uId, phone: phone);
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      CreateUserErrorState();
    });
  }

  Icon suffix = Icon(Icons.visibility_outlined);
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword
        ? Icon(Icons.visibility_outlined)
        : Icon(Icons.visibility_off_outlined);
    emit(changeSignupPasswordVisibilityState());
  }
}
