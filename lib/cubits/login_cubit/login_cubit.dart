import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_training/cubits/login_cubit/login_states.dart';
import 'package:firebase_training/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  bool ispassword = true;
  Icon suffixOff = Icon(Icons.visibility_off);
  Icon suffixOn = Icon(Icons.visibility);

  void changePasswordVisibility() {
    ispassword = !ispassword;
    emit(changePasswordVisibilityState());
  }

  void UserLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoadingLoginState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {



        print('email verified');
        print(value.user!.email);
        print(value.user!.uid);
        mybox!.put('uId', value.user!.uid);
   


        emit(SocialLoginSuccessState( value.user!.uid));
    
    }).catchError((error) {
      print(error.toString());
      emit(SocialLoginErrorState(error.toString()));
    });
  }
  // void UserLogin({
  //   required String email,
  //   required String password,
  // }) {
  //   emit(SocialLoadingLoginState());
  //   DioHelper.postData(url: 'login', data: {
  //     'email': email,
  //     'password': password,
  //   }).then((value) {
  //     loginModel = LoginModel.fromJson(value.data);
  //     mybox!.put('UserData', loginModel);

  //     print(value.data['message']);
  //     emit(LoginSuccessState(loginModel: loginModel));
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(LoginErrorState(error.toString()));
  //   });
  // }
}
