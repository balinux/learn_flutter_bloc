import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    print("PREBUILD");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Belajar Cubit"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              initialData: _counterCubit.initialData,
              stream: _counterCubit.stream,
              builder: (context, snapshot) {
                return Center(
                    child: Text(
                  "${snapshot.data}",
                  style: TextStyle(fontSize: 30),
                ));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      _counterCubit.increment();
                    },
                    icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {
                      _counterCubit.decrement();
                    },
                    icon: const Icon(Icons.remove))
              ],
            )
          ],
        ));
  }
}
