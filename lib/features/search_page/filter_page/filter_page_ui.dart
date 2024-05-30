import 'package:flutter/material.dart';
import 'package:mymovieapp/features/search_page/filter_page/filter_page_viewmodel.dart';
import 'package:mymovieapp/features/search_page/filter_page/widgets/box_container_text.dart';

class FilterPageUi {
  static void showFilterModal(BuildContext context) {
    FilterPageViewmodel viewmodel = FilterPageViewmodel.getInstance();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.grey[800],
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sort and Filter',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
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
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: BoxContainerText(
                        text: 'Year',
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: BoxContainerText(text: 'Rating'),
                    ),
                    InkWell(
                      onTap: () {},
                      child: BoxContainerText(text: 'Date'),
                    ),
                    InkWell(
                      onTap: () {},
                      child: BoxContainerText(text: 'Like_count'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.white60,
                  height: 20,
                  thickness: 2,
                ),
                ValueListenableBuilder(
                    valueListenable: viewmodel.genreFilters,
                    builder: (context, value, _) {
                      return Wrap(
                        direction: Axis.horizontal,
                        spacing: 8.0,
                        children: value
                            .map((e) => ChoiceChip(
                                  label: Text(e.genre.name),
                                  selected: e.isSelected,
                                  onSelected: (isSelected) {
                                    viewmodel.onClickedGenreFilter(
                                      e,
                                      isSelected,
                                    );
                                  },
                                ))
                            .toList(),
                      );
                    }),
                const Text(
                  'Sorted By',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                ValueListenableBuilder(
                  valueListenable: viewmodel.sortBy,
                  builder: (context, value, _) {
                    return Row(
                        children: SortBy.values
                        .where((e) => e != SortBy.none)
                            .map(
                              (e) => ChoiceChip(
                                label: Text(e.name),
                                selected: e.name == value.name,
                                onSelected: (isSelected) {
                                  viewmodel.onChangedSortBy(e);
                                },
                              ),
                            )
                            .toList());
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      border: Border.all(
                        color:
                            Colors.indigoAccent, // Border color// Border width
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: InkWell(
                      onTap: () {
                        print("Apply");
                      },
                      child: const Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
