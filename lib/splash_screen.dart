

import 'package:bloc_sample_application/home/screen/Home_page.dart';
import 'package:bloc_sample_application/login/login_screen.dart';
import 'package:bloc_sample_application/splash_bloc/splash_bloc.dart';
import 'package:bloc_sample_application/splash_bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  SplashScreen.withKey({Key? key}) : super(key: key);

  late final loginState;

  @override
  Widget build(BuildContext context) {
    checkLogin();
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashLoadedLoginState) {
          if (loginState == true) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const HomeScreen()));
          } else {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => LoginScreen()));
          }
        }
      },
      child: Scaffold(
        body: Center(
          child: SizedBox(
            height: 220,
            child: Image.asset('images/pluginIcon.png')),
        ),
      ),
    );
  }

  Future<void> checkLogin() async {
    final shared = await SharedPreferences.getInstance();
    loginState = shared.getBool('Login');
  }
}

