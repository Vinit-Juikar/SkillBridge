// import 'package:skillbridge/Screens/navBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skillbridge/login/auth.dart';
import 'package:skillbridge/login/login_or_register.dart';
import 'package:skillbridge/login/phone.dart';
import 'package:skillbridge/login/provider_seeker.dart';
import 'package:skillbridge/seeker/register_info_seeker.dart';
import 'verify.dart';

class WidgetTreeWindow extends StatefulWidget {
  const WidgetTreeWindow({super.key});

  @override
  State<WidgetTreeWindow> createState() => _WidgetTreeWindowState();
}

class _WidgetTreeWindowState extends State<WidgetTreeWindow> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String name = 'false';
    name = user?.displayName ?? 'false';
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
            return const ProviderSeeker();
        } else {
          return MaterialApp(
            initialRoute: 'information',
            routes: {
              'information': (context) =>  const LoginOrRegister(),
              'phone': (context) => const MyPhone(),
              'verify': (context) => const MyVerify(),
              'home': (context) => const RegisterInfoSeeker(),
            },
          );
        }
      },
    );
  }
}
