import 'package:flutter/material.dart';
import 'package:video_download_app/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image download',
      theme: ThemeData(
      ),
      home:const HomePage(),
    );
  }
}

