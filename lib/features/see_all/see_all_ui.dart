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
        return SafeArea(
          child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
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
                        "Movie List",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: movies?.length,
                      itemBuilder: (context, index) {
                        final movie = movies?[index];
                        return Container(
                          height: MediaQuery.of(context).size.height / 6,
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.height * .15,
                                height: MediaQuery.of(context).size.width * .35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: NetworkImage(movie!.largeCoverImage ?? ""),
                                    fit: BoxFit.fill,
                                  )
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      maxLines: 1,
                                      movie.title ?? "",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      movie.year.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      movie.genres != null ?'Genres: ${movie.genres?.join(", ")}' : 'hello',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
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
                                                            .largeCoverImage ?? "",
                                                        releaseYear: movie.year
                                                            .toString(),
                                                        runtime: movie.runtime
                                                            .toString(),
                                                        rating: movie.rating
                                                            .toString(),
                                                        genres: movie.genres ?? [],
                                                        id: movie.id!));
                                                CustomSnackbar.show(context, "Added to Watchlist");
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
