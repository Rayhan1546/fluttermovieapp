import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/common/widgets/custom_snack_bar.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/data/models/watch_list_movie_model.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';
import 'package:mymovieapp/features/home_page/widgets/box_shape_text.dart';
import 'package:mymovieapp/features/home_page/widgets/page_indicator.dart';
import 'package:mymovieapp/features/movie_details/movie_details_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PageViewBuilder extends StatelessWidget {
  PageViewBuilder({super.key});

  HomepageViewmodel viewModel = HomepageViewmodel.getInstance();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: viewModel.movies,
      builder: (context, movielist, _) {
        if (movielist == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (movielist.isEmpty) {
          return const Center(child: Text('No movies available'));
        } else {
          int itemSize = movielist.length > 15 ? 15 : movielist.length;
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.7,
                child: PageView.builder(
                  onPageChanged: (int page) {
                    viewModel.pageIndexChage(page);
                  },
                  itemCount: itemSize,
                  itemBuilder: (context, index) {
                    final movie = movielist[index];
                    return _buildMovieItem(
                        movie,
                        index,
                        MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width,
                        itemSize,
                        context);
                  },
                ),
              ),
              PageIndicator(itemSize: itemSize, pageIndex: 0),
            ],
          );
        }
      },
    );
  }

  Widget _buildMovieItem(Movies movie, int pagePosition, double height,
      double width, int itemSize, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsUi(
              id: movie.id!,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey,
          image: DecorationImage(
            image: CachedNetworkImageProvider(movie.largeCoverImage ?? ""),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), // Adjust the opacity as needed
              BlendMode.darken, // You can also try other BlendModes
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: ClipRect(
                // Clip the filter to half
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  // Adjust blur intensity as needed
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    height: height * .10,
                    decoration: const BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      border: Border(
                        top: BorderSide(
                          color: Colors.white38,
                          width: .5,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width / 2.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                movie.title!,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                movie.genres != null
                                    ? movie.genres!.length > 3
                                        ? movie.genres!.sublist(0, 3).join(", ")
                                        : movie.genres!.join(", ")
                                    : 'Hello',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  BoxShapeText(text: movie.year.toString()),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  BoxShapeText(text: '${movie.runtime}m'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  BoxShapeText(text: movie.language ?? "")
                                ],
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height / 45),
                              height: height * .038,
                              width: width * .35,
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  viewModel.onClickAddToWatchLit(
                                      WatchListMovieModel(
                                          name: movie.title!,
                                          id: movie.id!,
                                          image: movie.largeCoverImage!,
                                          releaseYear: movie.year.toString(),
                                          runtime: movie.runtime.toString(),
                                          rating: movie.rating.toString(),
                                          genres: movie.genres!));
                                  CustomSnackbar.show(
                                      context, "Added to Watchlist");
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.add_to_favorite,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    height: 25,
                    width: 60,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          movie.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
