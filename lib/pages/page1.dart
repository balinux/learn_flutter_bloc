import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = context.read<Counter>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Center(
          child: BlocBuilder<Counter, int>(
        bloc: counter,
        builder: (context, state) {
          return Text("$state");
        },
      )),
    );
  }
}
