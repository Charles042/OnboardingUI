import 'package:flutter/material.dart';
import 'package:onboarding_UI/screens/mainscreen.dart';
 
 void main() => runApp((MyApp()));
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: MainScreen(),
       theme: ThemeData(
        primaryColor: Colors.white
       ),
     );
   }
 }