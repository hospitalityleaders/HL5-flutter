import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holedo/application/profile_notifier/profile_notifier.dart';

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>(
        (ref) => ProfileNotifier());
