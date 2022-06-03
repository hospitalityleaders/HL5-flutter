import 'package:holedo/models/models.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Holedo Home",
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Wrap(
            children: [
              //for (final book in Get.put(HoledoDatabase()).books)
              //  BookCard(book: book),
              for (final category in Get.put(HoledoDatabase())
                  .articleCategories
                  .where((category) => category.menuItem == true))
                NewsCategoryCard(category: category),
            ],
          ),
        ],
      ),
    );
  }
}
