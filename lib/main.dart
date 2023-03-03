import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skillbridge/login/widget_tree.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static  const String _title = 'Skill Bridge';

  @override
  Widget build(BuildContext context) {
    return    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: WidgetTreeWindow(),
      // initialRoute: 'phone',
      // routes: {
      //   'phone': (context) => const MyPhone(),
      //   'verify': (context) => const MyVerify(),
      //   'home': (context) =>  HomePage(),
      // },
    );
  }
}
