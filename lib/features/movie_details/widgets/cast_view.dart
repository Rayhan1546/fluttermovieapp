import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mymovieapp/features/movie_details/movie_details_viewmodel.dart';

class CastView extends StatelessWidget {
  CastView({super.key});

  MovieDetailsViewModel viewModel = MovieDetailsViewModel.getInstance();

  get index => null;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MovieDetailsViewModel.movieDetails,
      builder: (context, movie, _) {
        return SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie?.cast.length,
              itemBuilder: (context, index) {
                final castMember = movie?.cast[index];
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width / 5,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        image: DecorationImage(
                          image: NetworkImage(
                            castMember?.urlSmallImage ?? " ",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}
