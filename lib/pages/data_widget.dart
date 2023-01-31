import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: Center(
          child: BlocBuilder(
        bloc: BlocProvider.of<Counter>(context),
        builder: (context, state) {
          return Text(
            "$state",
            style: TextStyle(fontSize: 50, color: Colors.white),
          );
        },
      )),
    );
  }
}
