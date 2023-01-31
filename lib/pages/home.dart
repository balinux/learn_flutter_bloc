import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter.dart';
import 'package:learn_flutter_bloc/pages/data_widget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  Counter _counter = Counter(init: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bloc provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 70,
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    _counter.decrement();
                  },
                  child: Center(
                      child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  )),
                ),
              ),
              DataWidget(counter: _counter),
              Container(
                height: 100,
                width: 70,
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    _counter.increment();
                  },
                  child: Center(
                      child: Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
