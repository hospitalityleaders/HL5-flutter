import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ActivitySection extends StatelessWidget {
  const ActivitySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Activity Section",
        style: display1,
      ),
    );
  }
}
