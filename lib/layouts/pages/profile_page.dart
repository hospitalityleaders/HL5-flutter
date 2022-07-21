import 'package:flutter/material.dart';

import 'package:holedo/layouts/page_scaffold.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_page.dart';

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
    final bool isMyProfile = widget.id != null;
    return PageScaffold(
      title: 'Profile',
      body: FutureBuilder<User>(
        future: Get.put(HoledoDatabase()).users.getProfileData(
              context: context,
              slug: widget.slug,
              id: widget.id,
            ),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Provider.of<ProfileProvider>(context, listen: false)
                .initializeProfile(
              user: snapshot.data!,
              isMyProfile: isMyProfile,
            );
            return UserProfilePage(
              isMyProfile: isMyProfile,
              userData: snapshot.data!,
            );
          }
        },
      ),
    );
  }
}











// import 'package:flutter/material.dart';
// 
// 
// import 'package:holedo/layouts/page_scaffold.dart';
// import 'package:holedo/models/models.dart';
// import 'package:holedo/profile/presentation/ui/pages/profile_page.dart';

// class ProfilePage extends StatefulWidget {
//   final String? id;
//   final String? slug;

//   const ProfilePage({Key? key, this.id, this.slug}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     debugPrint('profie? ${widget.slug},  ${widget.id}');
//     final appstate = Provider.of<ProfileProvider>(context);
//     final bool isMyProfile = widget.id != null;
//     // appstate.isLoggedIn && appstate.profile!.slug == widget.slug;
//     return PageScaffold(
//       title: 'Profile',
//       body: FutureBuilder<User>(
//         future: (isMyProfile)
//             ? Get.put(HoledoDatabase()).users.getProfileData(
//                 context: context, slug: widget.slug, id: widget.id)
//             : Get.put(HoledoDatabase()).users.getOtherUserProfile(
//                 context: context, slug: widget.slug, id: widget.id),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData ||
//               snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             if (isMyProfile) {
//               ref.read(profileNotifierProvider.notifier).changeIsMyProfile();
//             } else {
//               ref
//                   .read(profileNotifierProvider.notifier)
//                   .changeIsMyProfile(user: snapshot.data!);
//             }
//             return UserProfilePage();
//           }
//         },
//       ),
//     );
//   }
// }
