import 'package:file/display.dart';
import 'package:file/flutterArchiver.dart';
import 'package:file/speechtotext.dart';
import 'package:flutter/material.dart';
import 'archiver.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // decompressAndCopyDatabase();

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: YourScreen3());
  }

}
