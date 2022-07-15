import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holedo/profile/application//profile_notifier/profile_notifier.dart';
import 'package:holedo/models/models.dart' hide Provider;

final profileNotifierProvider =
    StateNotifierProvider<ProfileStateNotifier, ProfileState>(
  (ref) => ProfileStateNotifier(
    ref.watch(userProfileDataProvider),
  ),
);

final userProfileDataProvider =
    Provider<User>((ref) => Get.put(HoledoDatabase()).getModel().user!);
