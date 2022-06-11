import 'package:holedo/layouts/page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import 'package:routemaster/routemaster.dart';
import 'package:holedo/models/models.dart';

class NewsfrontPage extends StatelessWidget {
  const NewsfrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabState = TabPage.of(context);

    return PageScaffold(
      title: 'Newsfronts',
      body: ListView(
        children: [
          /*Wrap(
            children: [
              //for (final book in Get.put(HoledoDatabase()).books)
              //  BookCard(book: book),
              for (final category in Get.put(HoledoDatabase())
                  .articleCategories
                  .where((category) => category.menuItem == true))
                NewsCategoryCard(category: category),
            ],
          ),*/
          SizedBox(
            height: 500,
            child: TabBarView(
              controller: tabState.controller,
              children: <Widget>[
                for (var i = 0;
                    i <
                        Get.put(HoledoDatabase())
                            .articleCategories
                            .where((category) => category.menuItem == true)
                            .length;
                    i++)
                  PageStackNavigator(stack: tabState.stacks[i]),
              ],
            ),
          ),
          Container(
            color: Color(0xff202f3f),
            height: 70,
            child: TabBar(
              indicatorWeight: 6,
              controller: tabState.controller,
              tabs: [
                for (final category in Get.put(HoledoDatabase())
                    .articleCategories
                    .where((category) => category.menuItem == true))
                  Tab(text: category.title),
                //Tab(icon: Icon(Icons.list), text: 'All News'),
                //Tab(icon: Icon(Icons.star), text: 'Featured'),
              ],
            ),
          ),
          SizedBox(
            height: 500,
            child: TabBarView(
              controller: tabState.controller,
              children: <Widget>[
                for (var i = 0;
                    i <
                        Get.put(HoledoDatabase())
                            .articleCategories
                            .where((category) => category.menuItem == true)
                            .length;
                    i++)
                  PageStackNavigator(stack: tabState.stacks[i]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsfrontListPage extends StatelessWidget {
  final String mode;
  final ArticleCategory? category;

  const NewsfrontListPage({
    Key? key,
    required this.mode,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final articles = HoledoDatabase().articles(slug: mode);
    // final NewsController controller = Get.put(HoledoDatabase().news);
    //newsController.fetchArticles(category: mode);
    print('test: article ${category?.slug}');
    return Scaffold(
        body: FutureBuilder(
            future: Get.put(HoledoDatabase().news).fetchArticles(
                context: context, type: mode, category: category?.slug),
            builder: (context, AsyncSnapshot<List<Article>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else
                return AlignedGridView.count(
                  crossAxisCount: 2,
                  itemCount: snapshot.data!.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return NewsCard(
                        article: snapshot.data![index], showReleaseDate: true);
                  },

                  //TileBuilder: (index) => StaggeredTile.fit(1),
                );
            }));
  }
}
