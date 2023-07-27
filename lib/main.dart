import 'package:flutter/material.dart';
import 'package:smart_home/route/name.dart';
import 'package:smart_home/route/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home',
            debugShowCheckedModeBanner: false,
      initialRoute: FromScreens.root,
      routes: routes,
      theme: ThemeData(
        useMaterial3: true,
      ),
      
    );
  }
}
