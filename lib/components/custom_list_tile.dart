import 'package:flutter/material.dart';
import 'package:holedo/components/container_with_icon.dart';
import 'package:holedo/components/text_with_background.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Di.PSS),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ContainerWithIcon(
                    iconData: Icons.add,
                    size: 12,
                    iconSize: 10,
                  ),
                  Di.SBWS,
                  Text(
                    "Add your work experience",
                    style: bodyLarge.copyWith(
                      color: Cr.accentBlue1,
                    ),
                  ),
                ],
              ),
              TextWithBackground(
                text: "+20%",
                backgroundColor: Cr.darkBlue1,
                textColor: Cr.accentBlue1,
              )
            ],
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
