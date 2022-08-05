import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categoryscreen';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              catData.id,
              catData.title,
              catData.color,
              catData.image,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        childAspectRatio: 4 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,

        // maxCrossAxisExtent: 200,
        // childAspectRatio: 3 / 2,
        // crossAxisSpacing: 20,
        // mainAxisSpacing: 20,
      ),
    );
  }
}
