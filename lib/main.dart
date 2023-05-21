import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotonresponse/view/screens/authentication/auth_screen.dart';
import 'package:spotonresponse/view/screens/home_screen/home_screen.dart';
import 'package:spotonresponse/view/screens/project_selection/project_selection_screen.dart';

// Obtain shared preferences.
SharedPreferences? prefs;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  if (Platform.isAndroid || Platform.isIOS) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC_QptCcFcGBchdYmF6IQLRtiUK2wNOl1c",
            authDomain: "sor-project-387015.firebaseapp.com",
            projectId: "sor-project-387015",
            storageBucket: "sor-project-387015.appspot.com",
            messagingSenderId: "846251353817",
            appId: "1:846251353817:web:1a0967d9237177b88540c8",
            measurementId: "G-45MMBG5BJ6"));
  }

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent),
            home: prefs?.getString("auth") == null
                ? const AuthScreen()
                : const ProjectSelectionScreen(),
          );
        });
  }
}
