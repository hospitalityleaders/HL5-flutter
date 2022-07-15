import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:holedo/profile/application//shared/providers.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_page.dart';

class ProfilePage extends ConsumerStatefulWidget {
  final String? id;
  final String? slug;

  const ProfilePage({Key? key, this.id, this.slug}) : super(key: key);

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    debugPrint('profie? ${widget.slug},  ${widget.id}');
    final appstate = Provider.of<AppState>(context);
    final bool isMyProfile = widget.id != null;
    // appstate.isLoggedIn && appstate.profile!.slug == widget.slug;
    return PageScaffold(
      title: 'Profile',
      body: FutureBuilder<User>(
        future: (isMyProfile)
            ? Get.put(HoledoDatabase()).users.getProfileData(
                context: context, slug: widget.slug, id: widget.id)
            : Get.put(HoledoDatabase()).users.getOtherUserProfile(
                context: context, slug: widget.slug, id: widget.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (isMyProfile) {
              ref.read(profileNotifierProvider.notifier).changeIsMyProfile();
            } else {
              ref
                  .read(profileNotifierProvider.notifier)
                  .changeIsMyProfile(user: snapshot.data!);
            }
            return UserProfilePage();
          }
        },
      ),
    );
  }
}
