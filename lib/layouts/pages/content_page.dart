import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:holedo/models/holedoapi/page.dart' as content;
import 'package:holedo/models/models.dart';
import 'package:holedo/layouts/page_scaffold.dart';

class ContentPage extends StatelessWidget {
  final String? id;
  final String slug;
  const ContentPage({Key? key, this.id, required this.slug}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "Content Content",
      body: FutureBuilder(
        future: Get.put(HoledoDatabase()).getPage(slug: slug),
        builder: (context, AsyncSnapshot<content.PageContent?> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return snapshot.data == null
                ? Container()
                : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, index) => Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            if (snapshot.data?.bannerImage != null)
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data?.bannerImage as String),
                                    fit: BoxFit.cover,
                                    repeat: ImageRepeat.noRepeat,
                                  ),
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.white,
                                ),
                                height: 300,
                                child: snapshot.data?.bannerImage != null
                                    ? null
                                    : Icon(
                                        CupertinoIcons.news,
                                        size: 55,
                                        color: Colors.grey,
                                      ),
                              ),
                            SizedBox(
                                height: snapshot.data?.bannerImage == null
                                    ? 5
                                    : 15),
                            Text(
                              snapshot.data!.title.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            SingleChildScrollView(
                                child: Html(
                              data: snapshot.data?.content,
                            )),
                          ],
                        ),
                      ),
                    ),
                  );
        },
      ),
    );
  }
}
