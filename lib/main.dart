import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:winnie_user/screens/auth/sign_in_page.dart';

import 'constants/constants.dart';
import 'screens/home_screen/custom_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Winnie',
        theme: theme(),
        home: const SignInPage());
  }
}
