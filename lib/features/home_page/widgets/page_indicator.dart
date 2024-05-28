import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';

class PageIndicator extends StatelessWidget {
  final int itemSize;
  final int pageIndex;

  PageIndicator({super.key, required this.itemSize, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: HomepageViewmodel.pageIndex,
        builder: (context, pageIndex, _) {
          return Positioned(
            left: MediaQuery.of(context).size.width * .60,
            top: MediaQuery.of(context).size.height * .25,
            child: SizedBox(
              height: 4,
              width:  MediaQuery.of(context).size.width * .35,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: itemSize,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: index == pageIndex ? 10 : 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 3,
                  );
                },
              ),
            ),
          );
        });
  }
}
