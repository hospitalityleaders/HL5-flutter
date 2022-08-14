import 'package:flutter/material.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/providers/app_provider.dart';

class CategoryPage extends StatefulWidget {
  final ArticleCategory category;

  const CategoryPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

// ignore: must_be_immutable
class _CategoryPageState extends State<CategoryPage> {
  late final Future<List<Article>> futurecall;

  @override
  void initState() {
    super.initState();
    debugPrint('news frontPage');
    futurecall = Provider.of<AppProvider>(context, listen: false).newscontroller.fetchArticles(context: context, category: widget.category.slug);
    debugPrint('init data: $futurecall');
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Category News",
      body: Column(
        children: [
          FutureBuilder(
            future: futurecall,
            builder: (context, AsyncSnapshot<List<Article>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return AlignedGridView.count(
                  crossAxisCount: 2,
                  itemCount: snapshot.data!.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return NewsCard(
                      article: snapshot.data![index],
                      showReleaseDate: true,
                    );
                  },

                  //TileBuilder: (index) => StaggeredTile.fit(1),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
