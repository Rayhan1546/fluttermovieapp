import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/common/widgets/custom_snack_bar.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/features/movie_details/movie_details_ui.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class WatchListUi extends StatelessWidget {
  WatchListUi({super.key});

  WatchListViewmodel viewmodel = WatchListViewmodel.getInstance();

  @override
  Widget build(BuildContext context) {
    viewmodel.getFavouriteMovies();
    return ValueListenableBuilder<List<WatchListMovieModel>>(
      valueListenable: viewmodel.favouriteMovieList,
      builder: (context, movies, _) {
        if (movies.isEmpty) {
          return Container(
              child: const Center(
            child: Text(
              "Watch list is empty!",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ));
        } else {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Watch List',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailsUi(
                                  id: movie.id,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5.7,
                            margin: const EdgeInsets.all(5),
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.height * .15,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          movie.image,
                                        ),
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5,),
                                      Text(
                                        maxLines: 1,
                                        movie.name,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        movie.releaseYear,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Genres: ${movie.genres.join(", ")}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          const Spacer(),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                30,
                                            child: ElevatedBtn(
                                                fontsize: 15,
                                                buttonText: 'Remove',
                                                backgroundColor:
                                                    Colors.indigoAccent,
                                                onPressed: () {
                                                  viewmodel
                                                      .onClickRemoveToFavourite(
                                                          movie);
                                                  CustomSnackbar.show(
                                                      context, "Removed");
                                                },
                                                textcolor: Colors.white),
                                          ),
                                        ],
                                      ),
                                      Spacer(flex: 1,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
