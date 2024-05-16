import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/data/repository/apicall_function.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';


class PageViewBuilder extends StatelessWidget {
  PageViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ApiCallFunction.popularMovies,
      builder: (context, popularMovies, _) {
        if (popularMovies == null) {
          print(popularMovies);
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: popularMovies.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(popularMovies[index].backgroundImageOriginal!),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
