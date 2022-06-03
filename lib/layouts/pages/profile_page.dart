import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/user.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/layouts/page_scaffold.dart';

class ProfilePage extends StatelessWidget {
  final String? id;
  final String? slug;
  const ProfilePage({Key? key, this.id, this.slug}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UsersController controller = Get.put(HoledoDatabase().users);
    return PageScaffold(
        title: "Job Content",
        body: FutureBuilder(
            future:
                controller.getProfileData(context: context, slug: slug, id: id),
            builder: (context, AsyncSnapshot<User?> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, index) => Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      title: Text(snapshot.data!.fullName.toString()),
                      subtitle: Text(snapshot.data!.email.toString()),
                    ),
                  ),
                );
            }));
  }
}
