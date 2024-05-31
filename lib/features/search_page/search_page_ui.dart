import 'package:flutter/material.dart';
import 'package:mymovieapp/common/widgets/custom_snack_bar.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/features/movie_details/movie_details_ui.dart';
import 'package:mymovieapp/features/search_page/filter_page/filter_page_ui.dart';
import 'package:mymovieapp/features/search_page/search_page_viewmodel.dart';

class SearchPageUi extends StatelessWidget {
  SearchPageUi({super.key});

  SearchPageViewmodel viewmodel = SearchPageViewmodel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewmodel.searchListMovies,
        builder: (context, movies, _) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                color: Colors.black,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Search.",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            FilterPageUi().showFilterModal(context);
                          },
                          child: const Icon(
                            Icons.manage_search,
                            color: Colors.white,
                            size: 35,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: viewmodel.searchController,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (String newText) {
                          viewmodel.onSearchChanged(newText);
                        },
                        decoration: InputDecoration(
                          labelText: 'Search...',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          labelStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.white10,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white70, width: 2.0),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Search Results",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    movies == null
                        ? const Expanded(
                            child: Center(
                              child: Text(
                                "No matched Result",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: movies.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MovieDetailsUi(
                                          id: movies[index].id!,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 6,
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            movies[index].largeCoverImage!,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .15,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .35,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                maxLines: 1,
                                                movies[index].title!,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                movies[index].year.toString(),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                'Genres: ${movies[index].genres!.join(", ")}',
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
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            28,
                                                    child: ElevatedBtn(
                                                        fontsize: 15,
                                                        buttonText:
                                                            'Add to Watchlist',
                                                        backgroundColor:
                                                            Colors.indigoAccent,
                                                        onPressed: () {
                                                          viewmodel.onClickAddToWatchList(WatchListMovieModel(
                                                              name:
                                                                  movies[index]
                                                                      .title!,
                                                              id: movies[index]
                                                                  .id!,
                                                              image: movies[
                                                                      index]
                                                                  .largeCoverImage!,
                                                              releaseYear:
                                                                  movies[index]
                                                                      .year!
                                                                      .toString(),
                                                              runtime: movies[
                                                                      index]
                                                                  .runtime!
                                                                  .toString(),
                                                              rating: movies[
                                                                      index]
                                                                  .rating!
                                                                  .toString(),
                                                              genres: movies[
                                                                      index]
                                                                  .genres!));
                                                          CustomSnackbar.show(
                                                              context,
                                                              "Added to Watchlist");
                                                        },
                                                        textcolor:
                                                            Colors.white),
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
                          )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
