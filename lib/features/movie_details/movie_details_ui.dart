import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mymovieapp/common/widgets/custom_snack_bar.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/features/movie_details/movie_details_viewmodel.dart';
import 'package:mymovieapp/features/movie_details/widgets/box_shape_text.dart';
import 'package:mymovieapp/features/movie_details/widgets/rating_bar.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class MovieDetailsUi extends StatelessWidget {
  final int id;
  MovieDetailsUi({super.key, required this.id});

  MovieDetailsViewModel viewModel = MovieDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getMovieDetails(id);
    return ValueListenableBuilder<Movie?>(
        valueListenable: viewModel.movieDetails,
        builder: (context, movie, _) {
          if (movie == null) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SafeArea(
              child: Scaffold(
                  body: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                color: Colors.black,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Movie Details",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(movie.largeCoverImage!),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.genres!.length,
                          itemBuilder: (context, genreIndex) {
                            final isLastItem =
                                genreIndex == movie.genres!.length - 1;
                            String genre = movie.genres![genreIndex];
                            return isLastItem
                                ? Text(genre,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600))
                                : Text(
                                    genre + " ~ ",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  );
                          }),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        movie.title!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        BoxShapeText(text: movie.year!.toString()),
                        const Spacer(
                          flex: 1,
                        ),
                        BoxShapeText(text: movie.rating!.toString()),
                        const Spacer(
                          flex: 1,
                        ),
                        BoxShapeText(text: movie.imdbCode.toString()),
                        const Spacer(
                          flex: 16,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        movie.descriptionFull!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 15,
                        child: ElevatedBtn(
                            buttonText: "Add To Watchlist",
                            backgroundColor: Colors.indigoAccent.shade400,
                            onPressed: () {
                              viewModel.onClickAddFav(WatchListMovieModel(
                                  name: movie.title!,
                                  image: movie.largeCoverImage!,
                                  releaseYear: movie.year!.toString(),
                                  runtime: movie.runtime!.toString(),
                                  rating: movie.rating!.toString(),
                                  genres: movie.genres,
                                  id: movie.id!));
                              CustomSnackbar.show(context, "Added to Watchlist");
                            },
                            textcolor: Colors.white)),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        Column(
                          children: [
                            const Text(
                              "Overall Rating",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              movie.rating.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            RatingBar(rating: movie.rating! / 2),
                          ],
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Container(
                          width: 2,
                          height: 100, // Adjust height as needed
                          color: Colors.white, // Line color
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Column(
                          children: [
                            const Text(
                              "Your Rating",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            RatingBar(rating: 0),
                          ],
                        ),
                        const Spacer(
                          flex: 1,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Cast ~",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " Writter ~",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " Directer",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          "See All",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
              )),
            );
          }
        });
  }
}
