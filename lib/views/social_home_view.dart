import 'package:firebase_training/components/components.dart';

import 'package:firebase_training/cubits/social_cubit/social_cubit.dart';
import 'package:firebase_training/cubits/social_cubit/social_states.dart';
import 'package:firebase_training/views/social_login_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialHomeView extends StatelessWidget {
  const SocialHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit()..getUserData(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {
          if (state is SocialSignOutState) {
            navigateAndFinish(context, SocialLoginView());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              // remove backgroung color,
              backgroundColor: Colors.white,
              title: Text(
                'Social App',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      SocialCubit.get(context).signOut();
                    },
                    icon: Icon(
                      Icons.logout,
                      color: Colors.black,
                    ))
              ],
            ),
            body: SocialCubit.get(context)
                .pages[SocialCubit.get(context).cuttentIndex],
            // make email verification design
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: SocialCubit.get(context).cuttentIndex,
              onTap: (index) {
                SocialCubit.get(context).changeNavBar(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feeds'),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Users'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          );
        },
      ),
    );
  }
}
