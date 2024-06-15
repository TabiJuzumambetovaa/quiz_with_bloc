import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/bloc/quiz_bloc.dart';
import 'package:flutter_bloc_test/screens/qwestion_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizBloc>(
      create: (context) => QuizBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const QwestionScreen(),
      ),
    );
  }
}
