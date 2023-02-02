import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter.dart';
import 'package:learn_flutter_bloc/bloc/theme.dart';
import 'package:learn_flutter_bloc/pages/home.dart';
import 'package:learn_flutter_bloc/pages/page1.dart';
import 'package:learn_flutter_bloc/routes/routes.dart';

void main() {
  runApp(MyApp());
}

final Counter counter = Counter();
final ThemeBloc mytheme = ThemeBloc();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // class generate router
  final router = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => counter,
        ),
        BlocProvider(
          create: (context) => mytheme,
        )
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, state) {
          return MaterialApp(
            theme: state == true ? ThemeData.dark() : ThemeData.light(),
            home: MyHomePage(),
            // onGenerateRoute: router.onRoute,
          );
        },
      ),
    );
    // return BlocProvider(
    //   create: (context) => mytheme,
    //   child: BlocBuilder<ThemeBloc, bool>(
    //     bloc: mytheme,
    //     builder: (context, state) {
    //       return BlocProvider(
    //         create: (context) => Counter(),
    //         child: MaterialApp(
    //           theme: state == true ? ThemeData.dark() : ThemeData.light(),
    //           home: MyHomePage(),
    //           // onGenerateRoute: router.onRoute,
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
