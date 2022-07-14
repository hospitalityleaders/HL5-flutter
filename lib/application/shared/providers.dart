import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holedo/application/profile_notifier/profile_notifier.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) => ProfileNotifier(
    ref.watch(userProfileDataProvider),
  ),
);

final userProfileDataProvider =
    Provider<User>((ref) => DbData.getUserProfileData);
