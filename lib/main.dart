import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';  
import 'counter_event.dart';  
import 'counter_state.dart';  

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(), // Memberikan instance dari CounterBloc
        child: CounterScreen(),  // Menjalankan UI utama
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BLoC Counter'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Text(
              'Counter: ${state.counterValue}',  
              style: TextStyle(fontSize: 40),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Mengirim event IncrementEvent ke BLoC
              context.read<CounterBloc>().add(IncrementEvent());
            },
            child: Icon(Icons.add),
            tooltip: 'Increment',
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              // Mengirim event DecrementEvent ke BLoC
              context.read<CounterBloc>().add(DecrementEvent());
            },
            child: Icon(Icons.remove),
            tooltip: 'Decrement',
          ),
        ],
      ),
    );
  }
}
