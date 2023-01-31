import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  Counter _counter = Counter(init: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bloc listener"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<Counter, int>(
            bloc: _counter,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("dijalankan jika state berubah")));
            },
            listenWhen: (previous, current) {
              // set untuk menampilkan data jika mencapai 5
              if (current == 5) {
                return true;
              } else {
                return false;
              }
            },
            child: BlocBuilder<Counter, int>(
              bloc: _counter,
              builder: (context, state) {
                return Text(
                  "$state",
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    _counter.decrement();
                  },
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    _counter.increment();
                  },
                  icon: Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
