import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/job.dart';
import 'package:holedo/models/holedoapi/user.dart';
import 'package:routemaster/routemaster.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/layouts/page_scaffold.dart';

enum SortOrder { name, date }

extension SortOrderExtension on SortOrder {
  String get displayName {
    switch (this) {
      case SortOrder.name:
        return 'Name';
      case SortOrder.date:
        return 'Release date';
    }
  }

  String get queryParam {
    switch (this) {
      case SortOrder.name:
        return 'name';
      case SortOrder.date:
        return 'date';
    }
  }
}

class SearchPage extends StatelessWidget {
  final String query;
  final SortOrder sortOrder;

  const SearchPage({
    Key? key,
    required this.query,
    this.sortOrder = SortOrder.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articleCategory = Get.put(HoledoDatabase()).articleCategories;
    final categoryMatches = articleCategory.where((category) =>
        category.title!.toLowerCase().contains(query.toLowerCase()));

    final newsSearch = Get.put(HoledoDatabase().news);
    newsSearch.fetchArticles(context: context, keyword: query.toLowerCase());

    final jobsSearch = Get.put(HoledoDatabase().jobs);
    jobsSearch.fetchJobs(context: context, keyword: query.toLowerCase());

    final usersSearch = Get.put(HoledoDatabase().users);
    usersSearch.fetchUsers(context: context, keyword: query.toLowerCase());

    return PageScaffold(
      title: 'Search Results',
      searchQuery: query,
      body: ListView(
        padding: const EdgeInsets.all(50),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Sort by:"),
              SizedBox(width: 10),
              DropdownButton<SortOrder>(
                value: sortOrder,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (SortOrder? newValue) {
                  Routemaster.of(context).replace('/search', queryParameters: {
                    'query': query,
                    if (newValue != null) 'sort': newValue.queryParam,
                  });
                },
                items: SortOrder.values.map((SortOrder value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.displayName),
                  );
                }).toList(),
              ),
              SizedBox(width: 30),
            ],
          ),
          if (categoryMatches.isNotEmpty) ...[
            Text(
              'Categories',
              style: Theme.of(context).textTheme.headline5,
            ),
            for (final category in categoryMatches) ...[
              NewsCategoryCard(
                category: category,
                pathBuilder: (slug) => '/news/${category.slug}/',
              ),
            ]
          ],
          Text(
            'News Articles',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 350,
            child: Obx(() {
              if (newsSearch.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (newsSearch.dataList.isEmpty)
                  return Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text('No results found'),
                  );
                else
                  return AlignedGridView.count(
                    crossAxisCount: 2,
                    itemCount: newsSearch.dataList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return NewsCard(
                          article: newsSearch.dataList[index] as Article);
                    },

                    //TileBuilder: (index) => StaggeredTile.fit(1),
                  );
              }
            }),
          ),
          SizedBox(height: 20),
          Text(
            'Jobs',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 350,
            child: Obx(() {
              if (jobsSearch.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (jobsSearch.dataList.isEmpty)
                  return Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text('No results found'),
                  );
                else
                  return AlignedGridView.count(
                    crossAxisCount: 2,
                    itemCount: jobsSearch.dataList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return JobsCard(data: jobsSearch.dataList[index] as Job);
                    },

                    //TileBuilder: (index) => StaggeredTile.fit(1),
                  );
              }
            }),
          ),
          SizedBox(height: 20),
          Text(
            'Users',
            style: Theme.of(context).textTheme.headline5,
          ),
          Container(
            height: 350,
            child: Obx(() {
              if (usersSearch.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (usersSearch.userList.isEmpty)
                  return Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text('No results found'),
                  );
                else
                  return AlignedGridView.count(
                    crossAxisCount: 4,
                    itemCount: usersSearch.userList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return UserCard(
                          data: usersSearch.userList[index] as User);
                    },

                    //TileBuilder: (index) => StaggeredTile.fit(1),
                  );
              }
            }),
          ),
        ],
      ),
    );
  }
}
