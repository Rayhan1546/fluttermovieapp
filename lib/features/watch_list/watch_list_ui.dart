import 'package:flutter/material.dart';
import 'package:mymovieapp/common/Instance/watch_list_viewmodel_instance.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class WatchListUi extends StatelessWidget {
  WatchListUi({Key? key}) : super(key: key);

  WatchListViewmodel viewmodel = WatchListViewmodelInstance.getInstance();

  @override
  Widget build(BuildContext context) {
    viewmodel.getFavouriteMovies();
    return ValueListenableBuilder<List<Movie>>(
      valueListenable: viewmodel.favouriteMovieList,
      builder: (context, movies, _) {
        if (movies.isEmpty) {
          return Container(
              color: Colors.black,
              child: const Center(
                child: Text("Watch list is empty!", style: TextStyle(color: Colors.white,fontSize: 20),),
              )
          );
        } else {
          return Scaffold(
            body: Container(
              color: Colors.black,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Watch List',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
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
                        return Container(
                          height: MediaQuery.of(context).size.height / 6,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  movie.largeCoverImage!,
                                  width:
                                      MediaQuery.of(context).size.height * .15,
                                  height:
                                      MediaQuery.of(context).size.width * .35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      maxLines: 1,
                                      movie.title!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      movie.year.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Genres: ${movie.genres!.join(", ")}',
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
                                    Row(
                                      children: [
                                        Spacer(),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.8,
                                          child: ElevatedBtn(
                                              fontsize: 15,
                                              buttonText: 'Remove',
                                              backgroundColor:
                                                  Colors.indigoAccent,
                                              onPressed: () {
                                                viewmodel.onClickRemoveToFavourite(movie);
                                              },
                                              textcolor: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
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
