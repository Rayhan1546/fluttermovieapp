import 'package:flutter/material.dart';
import 'package:mymovieapp/features/search_page/filter_page/filter_page_viewmodel.dart';
import 'package:mymovieapp/features/search_page/filter_page/widgets/box_container_text.dart';
import 'package:mymovieapp/features/search_page/filter_page/widgets/enums.dart';

class FilterPageUi extends StatelessWidget {
  final VoidCallback onPressed;
  FilterPageUi({Key? key, required this.onPressed});

  FilterPageViewmodel viewmodel = FilterPageViewmodel.getInstance();

  @override
  Widget build(BuildContext context) {
    return showFilterModal(context);
  }

  showFilterModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.grey[800],
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .60,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sort and Filter',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Divider(
                  color: Colors.white60,
                  height: 20,
                  thickness: 2,
                ),
                const Text(
                  'Sort By',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                sortByWidget(),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.white60,
                  height: 20,
                  thickness: 2,
                ),
                const Text(
                  'Genres',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                genreWidget(),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.white60,
                  height: 20,
                  thickness: 2,
                ),
                const Text(
                  'Order By',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                sortedByWidget(),
                applyBtn(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget sortByWidget() {
    return ValueListenableBuilder(
      valueListenable: viewmodel.sortBy,
      builder: (context, value, _) {
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: SortBy.values
              .map(
                (e) => BoxContainerText(
                  text: e.name,
                  isSelected: e.name == value.name,
                  onClicked: () {
                    viewmodel.onChangedSortBy(e);
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget genreWidget() {
    return ValueListenableBuilder(
      valueListenable: viewmodel.genreFilters,
      builder: (context, value, _) {
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          runSpacing: 10,
          spacing: 13,
          direction: Axis.horizontal,
          children: value
              .map(
                (e) => BoxContainerText(
                  text: e.genre.name,
                  isSelected: e.isSelected,
                  onClicked: () {
                    viewmodel.onClickedGenreFilter(
                      e,
                      !e.isSelected,
                    );
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget sortedByWidget() {
    return ValueListenableBuilder(
      valueListenable: viewmodel.orderBy,
      builder: (context, value, _) {
        return Wrap(
          spacing: 10,
          children: OrderBy.values
              .map(
                (e) => BoxContainerText(
                  text: e.name,
                  isSelected: e.name == value.name,
                  onClicked: () {
                    viewmodel.onChangedSortedBy(e);
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }

  Widget applyBtn(context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 30,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          color: Colors.indigo,
          border: Border.all(
            color: Colors.indigoAccent, // Border color
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          onTap: onPressed,
          child: const Center(
            child: Text(
              'Apply',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
