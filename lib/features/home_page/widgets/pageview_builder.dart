import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mymovieapp/common/Instance/home_page_viewmodel_instance.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/data/models/popular_movie_list_model.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';
import 'package:mymovieapp/features/home_page/widgets/box_shape_text.dart';

class PageViewBuilder extends StatelessWidget {
  PageViewBuilder({Key? key}) : super(key: key);

  final HomepageViewmodel viewmodel = HomePageViewmodelInstance.getInstance();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomepageViewmodel.movieList,
      builder: (context, movielist, _) {
        if (movielist == null) {
          return Center(child: CircularProgressIndicator());
        } else if (movielist.isEmpty) {
          return Center(child: Text('No movies available'));
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3.7,
            child: PageView.builder(
              itemCount: movielist.length,
              itemBuilder: (context, index) {
                final movie = movielist[index];
                return _buildMovieItem(movie);
              },
            ),
          );
        }
      },
    );
  }

  Widget _buildMovieItem(Movies movie) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(movie.backgroundImageOriginal!),
          fit: BoxFit.fill,
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
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  height: 85,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            movie.title!,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            '${movie.genres!.join(", ")}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
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
                              BoxShapeText(
                                  text: movie.runtime.toString() + 'm'),
                              const SizedBox(
                                width: 8,
                              ),
                              BoxShapeText(text: movie.language!)
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.zero,
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Add to Watchlist",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   left: 220,
          //     top: 175,
          //     child: Container(
          //   padding: EdgeInsets.zero,
          //   height: 35,
          //   width: 140,
          //   decoration: BoxDecoration(
          //     color: Colors.indigo,
          //     borderRadius: BorderRadius.circular(8.0),
          //   ),
          //   child: TextButton(
          //     onPressed: () {},
          //     child: const Text(
          //       "Add to Watchlist",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 15,
          //       ),
          //     ),
          //   ),
          // )),
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
    );
  }
}
