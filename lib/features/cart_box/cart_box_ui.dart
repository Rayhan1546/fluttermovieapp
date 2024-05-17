import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mymovieapp/data/repository/cart_box_repo.dart';

class CartBoxUi extends StatelessWidget {
  const CartBoxUi({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CartBoxRepo.cartBoxMoviesList,
        builder: (context, movies, _) {
          if (movies == null || movies.isEmpty) {
            return Center(child: Text("Cart box is empty"));
          } else {
            return SafeArea(
                child: Scaffold(
                  body: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.star),
                          title: Text(movies[index].title!),
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                )
            );
          }
        });
  }
}
