import 'package:flutter/material.dart';
import 'package:mymovieapp/common/widgets/custom_snack_bar.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';
import 'package:mymovieapp/features/see_all/see_all_viewmodel.dart';

class SeeAllUi extends StatelessWidget {
  SeeAllUi({super.key});

  SeeAllViewmodel viewmodel = SeeAllViewmodel();
  HomepageViewmodel homepageViewmodel = HomepageViewmodel.getInstance();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Movies>?>(
      valueListenable: homepageViewmodel.movies,
      builder: (context, movies, _) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Movie List",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: movies?.length,
                      itemBuilder: (context, index) {
                        final movie = movies?[index];
                        return Container(
                          height: MediaQuery.of(context).size.height / 5.5,
                          margin: const EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.height * .16,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          movie!.largeCoverImage ?? ""),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 5,),
                                    Text(
                                      maxLines: 1,
                                      movie.title ?? "",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      movie.year.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      movie.genres!.length > 2
                                          ? 'Genres: ${movie.genres?.sublist(0, 2).join(", ")}'
                                          : 'Genres: ${movie.genres?.join(", ")}',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Spacer(flex: 3,),
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
                                              buttonText: 'Add to Watchlist',
                                              backgroundColor:
                                                  Colors.indigoAccent,
                                              onPressed: () {
                                                Movies movie = movies![index];
                                                viewmodel.onClickAddFav(
                                                    WatchListMovieModel(
                                                        name: movie.title ?? "",
                                                        image: movie
                                                                .largeCoverImage ??
                                                            "",
                                                        releaseYear: movie.year
                                                            .toString(),
                                                        runtime: movie.runtime
                                                            .toString(),
                                                        rating: movie.rating
                                                            .toString(),
                                                        genres:
                                                            movie.genres ?? [],
                                                        id: movie.id!));
                                                CustomSnackbar.show(context,
                                                    "Added to Watchlist");
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
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
