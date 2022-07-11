import 'package:flutter/material.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/ui/pages/profile_page.dart';

class ProfilePage extends StatefulWidget {
  final String? id;
  final String? slug;

  const ProfilePage({Key? key, this.id, this.slug}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final UsersController controller = Get.put(HoledoDatabase().users);
    return FutureBuilder<User>(
      future: controller.getProfileData(
        context: context,
        slug: widget.slug,
        id: widget.id,
      ),
      builder: (context, AsyncSnapshot<User> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else
          return PageScaffold(
            title: snapshot.data!.fullName.toString(),
            body: UserProfilePage(
              userProfileData: snapshot.data!,
            ),
          );
      },
    );
  }
}
