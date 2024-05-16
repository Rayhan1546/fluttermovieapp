import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mymovieapp/data/repository/apicall_function.dart';

class MovieDetailsUi extends StatelessWidget {
  const MovieDetailsUi({super.key});

  @override
  Widget build(BuildContext context) {
    ApiCallFunction.fetchMoviedetails();
    return Scaffold(

    );
  }
}
