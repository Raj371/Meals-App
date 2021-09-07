import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color,
              ),
            )
            .toList(),
        // sliver : in flutter means scrollable area on screen
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2, // (height/width ratio) how item should be sized regarding height and width relation
          mainAxisSpacing: 20, //spacing btw row
          crossAxisSpacing: 20, //spacing btw col
        ),
      );
  }
}