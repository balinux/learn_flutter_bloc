import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter.dart';
import 'package:learn_flutter_bloc/pages/404/404.dart';
import 'package:learn_flutter_bloc/pages/home.dart';
import 'package:learn_flutter_bloc/pages/page1.dart';

class AppRouter {
  final Counter counter = Counter();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counter,
            child: MyHomePage(),
          ),
        );
      case "/page1":
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counter,
            child: const Page1(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => const NotFoundPage());
    }
  }
}
