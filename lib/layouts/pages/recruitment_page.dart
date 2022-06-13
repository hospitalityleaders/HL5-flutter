import 'package:holedo/models/holedoapi/user.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:flutter/material.dart';

class RecruitmentPage extends StatelessWidget {
  const RecruitmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersController controller = Get.put(HoledoDatabase().users);
    return PageScaffold(
        title: "User List Home",
        body: FutureBuilder(
            future: controller.fetchUsers(context: context),
            builder: (context, AsyncSnapshot<List<User>?> snapshot) {
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
                    return UserCard(
                        data: snapshot.data![index], showReleaseDate: true);
                  },

                  //TileBuilder: (index) => StaggeredTile.fit(1),
                );
            }));
  }
}
