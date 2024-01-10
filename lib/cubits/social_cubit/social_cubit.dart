import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_training/cubits/social_cubit/social_states.dart';
import 'package:firebase_training/main.dart';
import 'package:firebase_training/models/user_model.dart';
import 'package:firebase_training/views/nav_bar_views/chat_view.dart';
import 'package:firebase_training/views/nav_bar_views/feeds_view.dart';
import 'package:firebase_training/views/nav_bar_views/settings_view.dart';
import 'package:firebase_training/views/nav_bar_views/users_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());
  static SocialCubit get(context) => BlocProvider.of(context);
  void signOut() async {
    await FirebaseAuth.instance.signOut();
    mybox!.delete('uId');
    emit(SocialSignOutState());
  }

  int cuttentIndex =mybox!.get('index',defaultValue: 0);
  UserModel? userModel;
  List<Widget> pages = [FeedsView(), ChatView(), UsersView(), SettingsView()];
  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(mybox!.get('uId'))
        .get()
        .then((value) {
      print(value.data());
      userModel = UserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  void changeNavBar(int value) {
    mybox!.put('index', value);
    cuttentIndex = mybox!.get('index');
    emit(SocialChangeBottomNavState());
  }
}
