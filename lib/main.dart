import 'package:flutter/material.dart';
import 'package:structure/home.dart';
import 'package:structure/models/custom_sidenav.dart';
import 'package:structure/sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Viewer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
      ),
      home:  Scaffold(
        body: Container(
          color: Color(0xffb1f2b36),
          child: Sidebar()),
      ),
    );
  }
}
