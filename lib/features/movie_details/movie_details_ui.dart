import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/repository/apicall_function.dart';
import 'package:mymovieapp/features/movie_details/movie_details_viewmodel.dart';
import 'package:mymovieapp/features/movie_details/widgets/box_shape_text.dart';
import 'package:mymovieapp/features/movie_details/widgets/rating_bar.dart';

class MovieDetailsUi extends StatelessWidget {
  final int index;
  MovieDetailsUi({super.key, required this.index});

  MovieDetailsViewModel viewModel = MovieDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewModel.popularMovies,
        builder: (context, popularMovies, _) {
          if (popularMovies == null || popularMovies.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SafeArea(
              child: Scaffold(
                  body: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                color: Colors.black,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const Text(
                      "Movie Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height / 3.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                popularMovies[index].mediumCoverImage!),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        )),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 20,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: popularMovies[index].genres!.length,
                          itemBuilder: (context, genreIndex) {
                            final isLastItem = genreIndex ==
                                popularMovies[index].genres!.length - 1;
                            String genre =
                                popularMovies[index].genres![genreIndex];
                            return isLastItem
                                ? Text(genre,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600))
                                : Text(
                                    genre + " ~ ",
                                    style: TextStyle(
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
                        popularMovies[index].title!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        BoxShapeText(
                            text: popularMovies[index].year!.toString()),
                        Spacer(
                          flex: 1,
                        ),
                        BoxShapeText(
                            text: popularMovies[index].rating!.toString()),
                        Spacer(
                          flex: 1,
                        ),
                        BoxShapeText(
                            text: popularMovies[index].imdbCode.toString()),
                        Spacer(
                          flex: 16,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        popularMovies[index].summary!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 15,
                        child: ElevatedBtn(
                            buttonText: "Add To Watchlist",
                            backgroundColor: Colors.indigoAccent.shade400,
                            onPressed: () {
                              viewModel.onClickAdd(popularMovies[index]);
                            },
                            textcolor: Colors.white)),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Column(
                          children: [
                            Text(
                              "Overall Rating",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              popularMovies[index].rating.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            RatingBar(rating: popularMovies[index].rating / 2),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          width: 2,
                          height: 100, // Adjust height as needed
                          color: Colors.white, // Line color
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Column(
                          children: [
                            Text(
                              "Your Rating",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            RatingBar(rating: 0),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Cast ~",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          " Writter ~",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
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
