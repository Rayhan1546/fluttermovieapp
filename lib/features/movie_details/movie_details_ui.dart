import 'package:flutter/material.dart';
import 'package:mymovieapp/common/widgets/custom_snack_bar.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/features/movie_details/movie_details_viewmodel.dart';
import 'package:mymovieapp/features/movie_details/shimmer/movie_details_shimmer.dart';
import 'package:mymovieapp/features/movie_details/widgets/box_shape_text.dart';
import 'package:mymovieapp/features/movie_details/widgets/cast_view.dart';
import 'package:mymovieapp/features/movie_details/widgets/rating_bar.dart';

class MovieDetailsUi extends StatelessWidget {
  final int id;
  MovieDetailsUi({super.key, required this.id});

  MovieDetailsViewModel viewModel = MovieDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.getMovieDetails(id);
    return ValueListenableBuilder<Movie?>(
        valueListenable: MovieDetailsViewModel.movieDetails,
        builder: (context, movie, _) {
          if (movie == null) {
            return const MovieDetailsShimmer();
          } else {
            return SafeArea(
              child: Scaffold(
                  body: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                color: Colors.black,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
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
                              viewModel.onClickClean();
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
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(movie.largeCoverImage ?? ""),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        height: 20,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movie.genres.length,
                            itemBuilder: (context, genreIndex) {
                              final isLastItem =
                                  genreIndex == movie.genres.length - 1;
                              String genre = movie.genres[genreIndex];
                              return isLastItem
                                  ? Text(genre,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600))
                                  : Text(
                                      "$genre ~ ",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    );
                            }),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              movie.title ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              viewModel.onClickTorrentLaunch(movie.torrents[0].url);
                            },
                            child: const Icon(Icons.download_outlined,
                                size: 30, color: Colors.white),
                          )
                        ],
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
                          height: MediaQuery.of(context).size.height / 16,
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
                                CustomSnackbar.show(
                                    context, "Added to Watchlist");
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
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                movie.rating.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              RatingBar(rating: movie.rating! / 2),
                            ],
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          Container(
                            width: 2,
                            height: MediaQuery.of(context).size.height / 9,
                            color: Colors.white,
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          const Column(
                            children: [
                              Text(
                                "Your Rating",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "0",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
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
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CastView(),
                    ],
                  ),
                ),
              )),
            );
          }
        });
  }
}
