import 'package:do_app/ui/auth/login.dart';
import 'package:do_app/ui/main_screens/first_page_screen.dart';
import 'package:do_app/ui/main_screens/profil/edit_password_screen.dart';
import 'package:do_app/ui/main_screens/profil/edit_profil_screen.dart';
import 'package:do_app/util/constants.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Constant.mainColor),
        useMaterial3: true,
      ),

      home: LoginScreen(),
      routes:{
        '/first_page': (context) => const FirstPageScreen(), 
        //'/login': (context) => const LoginScreen(),
        '/edit_profil': (context) => const EditProfilScreen(), 
        '/edit_password': (context) => const EditPasswordScreen(),                
      },
    );
  }
}

