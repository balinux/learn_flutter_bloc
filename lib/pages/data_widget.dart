import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter.dart';
import 'package:learn_flutter_bloc/bloc/theme.dart';

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
          child: BlocListener<ThemeBloc, bool>(
        listener: (context, state) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Dark Mode")));
        },
        listenWhen: (previous, current) {
          if (current == true) {
            return true;
          } else {
            return false;
          }
        },
        child: BlocListener<Counter, int>(
          listener: (context, state) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Data Diatas 5")));
          },
          listenWhen: (previous, current) {
            if (current > 5) {
              return true;
            } else {
              return false;
            }
          },
          child: BlocBuilder(
            bloc: BlocProvider.of<Counter>(context),
            builder: (context, state) {
              return Text(
                "$state",
                style: TextStyle(fontSize: 50, color: Colors.white),
              );
            },
          ),
        ),
      )),
    );
  }
}
