import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter.dart';
import 'package:learn_flutter_bloc/pages/home.dart';
import 'package:learn_flutter_bloc/pages/page1.dart';
import 'package:learn_flutter_bloc/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // class generate router
  final router = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.onRoute,
    );
  }
}
