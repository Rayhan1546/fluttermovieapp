import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/common/widgets/custom_snack_bar.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/data/hive_database/hive_data_source.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/data/remote/api_client.dart';
import 'package:mymovieapp/features/movie_details/movie_details_ui.dart';
import 'package:mymovieapp/features/search_page/filter_page/filter_page_ui.dart';
import 'package:mymovieapp/features/search_page/search_page_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchPageUi extends StatelessWidget {
  SearchPageUi({super.key});

  SearchPageViewmodel viewmodel = SearchPageViewmodel(
      hiveDataSource: HiveDataSource(), apiClient: ApiClient());

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewmodel.searchListMovies,
      builder: (context, movies, _) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.search,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        FilterPageUi(
                          onPressed: () {
                            viewmodel.getMovieList();
                            Navigator.pop(context);
                          },
                        ).showFilterModal(context);
                      },
                      child: Icon(
                        Icons.manage_search,
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
                    style: TextStyle(),
                    onChanged: (String newText) {
                      viewmodel.onSearchChanged();
                    },
                    decoration: InputDecoration(
                      labelText: 'Search...',
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      labelStyle: TextStyle(),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2.0),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Search Results",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                movies == null || movies.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            "No matched Result",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
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
                                height: MediaQuery.of(context).size.height / 5.5,
                                margin: const EdgeInsets.only(top: 10),
                                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              .16,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              movies[index].largeCoverImage ??
                                                  "",
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
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            maxLines: 1,
                                            movies[index].title!,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            movies[index].year.toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            movies[index].genres!.length > 2
                                                ? 'Genres: ${movies[index].genres!.sublist(0, 2).join(", ")}'
                                                : 'Genres: ${movies[index].genres!.join(", ")}',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          Spacer(),
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
                                                    28,
                                                child: ElevatedBtn(
                                                    fontsize: 15,
                                                    buttonText:
                                                        'Add to Watchlist',
                                                    backgroundColor:
                                                        Colors.indigoAccent,
                                                    onPressed: () {
                                                      viewmodel.onClickAddToWatchList(
                                                          WatchListMovieModel(
                                                              name: movies[
                                                                      index]
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
                                                    textcolor: Colors.white),
                                              ),
                                            ],
                                          ),
                                          Spacer(flex: 2,)
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
      },
    );
  }
}
