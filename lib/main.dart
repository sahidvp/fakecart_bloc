// import 'package:bloc_sample_application/login/login_screen.dart';
// import 'package:bloc_sample_application/splash_screen.dart';
// import 'package:flutter/material.dart';

// import 'home/screen/Home_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "E-cart",
//       home: LoginScreen(),

//     );
//   }
// }


import 'package:bloc_sample_application/cart_bloc/cart_bloc.dart';
import 'package:bloc_sample_application/splash_bloc/splash_bloc.dart';
import 'package:bloc_sample_application/splash_screen.dart';
import 'package:bloc_sample_application/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     create: (context) => CartBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce App',
        theme: myTheme,
        home: BlocProvider(
          create: (context) => SplashBloc(),
          child: SplashScreen(),
        ),
      ),
    );
  }
}
