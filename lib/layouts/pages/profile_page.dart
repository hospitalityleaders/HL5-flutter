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
    //final UsersController controller = ;
    debugPrint('profie? ${widget.slug},  ${widget.id}');
    return PageScaffold(
      title: 'Profile',
      body: FutureBuilder<User>(
        future: Get.put(HoledoDatabase())
            .users
            .getProfileData(context: context, slug: widget.slug, id: widget.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return UserProfilePage(
              userProfileData: snapshot.data!,
            );
          }
        },
      ),
    );
  }
}
