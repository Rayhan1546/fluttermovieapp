import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/data/repository/apicall_function.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ApiCallFunction.popularMovies,
      builder: (context, popularMovies, _) {
        if (popularMovies == null || popularMovies.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            height: MediaQuery.of(context).size.height / 2.9,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Ensure horizontal scrolling
              itemCount: popularMovies.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.40,
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: Column(
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            popularMovies[index].largeCoverImage!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          popularMovies[index].title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          popularMovies[index].year!.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
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
