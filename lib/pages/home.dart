import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/bloc/counter.dart';
import 'package:learn_flutter_bloc/pages/data_widget.dart';
import 'package:learn_flutter_bloc/pages/page1.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = context.read<Counter>();
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
                    // BlocProvider.of<Counter>(context).decrement();

                    //shordhand
                    counter.decrement();
                  },
                  child: const Center(
                      child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  )),
                ),
              ),
              DataWidget(),
              Container(
                height: 100,
                width: 70,
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    // BlocProvider.of<Counter>(context).increment();

                    //shordhand
                    counter.increment();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => BlocProvider.value(
          //     value: counter,
          //     child: const Page1(),
          //   ),
          // ));

          // BLOC accees named route access
          Navigator.of(context).pushNamed('/page1');
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
