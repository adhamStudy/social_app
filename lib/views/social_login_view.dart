import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_training/components/components.dart';
import 'package:firebase_training/cubits/login_cubit/login_cubit.dart';
import 'package:firebase_training/cubits/login_cubit/login_states.dart';
import 'package:firebase_training/views/shop_signup_view.dart';
import 'package:firebase_training/views/social_home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginView extends StatelessWidget {
  SocialLoginView({Key? key}) : super(key: key); // Added named key parameter

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // Added named key parameter
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        builder: (context, state) {
          var cubit = SocialLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Social Login'),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.light_mode))
              ], // Added const keyword
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // Added const keyword
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Login', // Added const keyword
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email', // Added const keyword
                            prefixIcon: Icon(Icons.email), // Added prefix icon
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              // Added null check
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0), // Added const keyword
                        TextFormField(
                          controller: _passwordController,
                          obscureText: cubit.ispassword,
                          onFieldSubmitted: (newValue) {
                            if (_formKey.currentState!.validate()) {}
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: InkWell(
                              onTap: () {
                                cubit.changePasswordVisibility();
                              },
                              child: cubit.ispassword
                                  ? cubit.suffixOn
                                  : cubit.suffixOff,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              // Added null check
                              return 'Please enter your password';
                            }
                            return null;
                          }, // Added suffix icon
                        ),

                        const SizedBox(height: 16.0), // Added const keyword
                        ConditionalBuilder(
                          condition: state is! SocialLoadingLoginState,
                          builder: (context) => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                cubit.UserLogin(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                              }
                            },
                            child: const Text(
                              'Login',
                            ), // Added const keyword
                          ),
                          fallback: (context) =>
                              Center(child: const CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                                'Don\'t have an account?'), // Added const keyword
                            TextButton(
                                child: Text('Register'), // Added const keyword
                                onPressed: () {
                                  navigateAndFinish(context, ShopSignUpView());
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is SocialLoginSuccessState) {
            
              navigateAndFinish(context, SocialHomeView());
          
          }
        },
      ),
    );
  }
}
