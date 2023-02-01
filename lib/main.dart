import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter.dart';
import 'package:learn_flutter_bloc/pages/home.dart';
import 'package:learn_flutter_bloc/pages/page1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Counter counter = Counter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: BlocProvider(
      //   create: (context) => Counter(),
      //   child: MyHomePage(),
      // ),
      initialRoute: "/",
      routes: {
        "/": (context) => BlocProvider(
              create: (context) => counter,
              child: MyHomePage(),
            ),
        "/page1": (context) => BlocProvider(
              create: (context) => counter,
              child: const Page1(),
            ),
      },
    );
  }
}
