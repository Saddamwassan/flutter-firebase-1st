// ignore_for_file: avoid_unnecessary_containers

// ignore: depend_on_referenced_packagesart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //firebase inlinzation
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              // ignore: prefer_const_constructors
              child: Text("Plz Check Firebase and NETWORK"),
            );
          } else {
            return MaterialApp(
              home: Scaffold(
                body: Text("data"),
              ),
            );
          }
        });
  }
}
