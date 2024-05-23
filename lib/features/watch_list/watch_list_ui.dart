import 'package:flutter/material.dart';
import 'package:mymovieapp/common/Instance/watch_list_viewmodel_instance.dart';
import 'package:mymovieapp/common/widgets/custom_snack_bar.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/data/models/movie_details_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/features/movie_details/movie_details_ui.dart';
import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class WatchListUi extends StatelessWidget {
  WatchListUi({Key? key}) : super(key: key);

  WatchListViewmodel viewmodel = WatchListViewmodelInstance.getInstance();

  @override
  Widget build(BuildContext context) {
    viewmodel.getFavouriteMovies();
    return ValueListenableBuilder<List<WatchListMovieModel>>(
      valueListenable: viewmodel.favouriteMovieList,
      builder: (context, movies, _) {
        if (movies.isEmpty) {
          viewmodel.getFavouriteMovies();
          return Container(
              color: Colors.black,
              child: const Center(
                child: Text("Watch list is empty!", style: TextStyle(color: Colors.white,fontSize: 20),),
              )
          );
        } else {
          return SafeArea(
            child: Scaffold(
              body: Container(
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Watch List',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailsUi(id: movie.id,),
                                ),
                              );
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 6,
                              margin: EdgeInsets.all(5),
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
                                      movie.image,
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
                                          movie.name,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          movie.releaseYear,
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
                                              child: ElevatedBtn(
                                                  fontsize: 15,
                                                  buttonText: 'Remove',
                                                  backgroundColor:
                                                      Colors.indigoAccent,
                                                  onPressed: () {
                                                    viewmodel.onClickRemoveToFavourite(movie);
                                                    CustomSnackbar.show(context, "Removed");
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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
