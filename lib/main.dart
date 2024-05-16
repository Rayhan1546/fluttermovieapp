import 'package:flutter/material.dart';
import 'package:mymovieapp/features/movie_details/movie_details_ui.dart';
import 'package:mymovieapp/features/page_transitions/page_transition_ui.dart';
import 'package:mymovieapp/features/home_page/homepage_ui.dart';
import 'package:mymovieapp/features/login/login_ui.dart';
import 'package:mymovieapp/features/registation/registation_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MovieDetailsUi(),
    );
  }
}
