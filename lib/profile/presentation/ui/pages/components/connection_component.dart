import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/ui/components/text_with_background.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

class ConnectionsComponent extends StatelessWidget {
  const ConnectionsComponent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Di.SBHETS,
          const ListTile(
            title: Text(
              "Connections",
              style: h2Regular,
            ),
          ),
          Di.DWZH,
          Di.SBCH(18),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? Di.PSL : 0),
              width: isMobile ? double.infinity : 324,
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Wrap(
                      children: [
                        Container(
                          width: 108,
                          height: 50,
                          color: Cr.accentBlue1,
                          child: Center(
                            child: Text(
                              "250+",
                              style: display2.copyWith(
                                color: Cr.whiteColor,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        ...[
                          "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",
                          "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2960&q=80",
                          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2788&q=80",
                          "https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1476&q=80",
                          "https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80",
                          "https://images.unsplash.com/photo-1593104547489-5cfb3839a3b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1453&q=80",
                          "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",
                          "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2960&q=80",
                          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2788&q=80",
                          "https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1476&q=80",
                        ].map(
                          (value) => Container(
                            width: 54,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(value),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.center,
                          colors: <Color>[
                            Cr.whiteColor,
                            Cr.whiteColorWithOpacity(0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Di.SBCH(14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
            child: Text(
              "You and Noberto have 25 shared connections.",
              style: bodySmallRegular.copyWith(color: Cr.darkGrey1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
            child: Text(
              "View mutual connections",
              style: bodySmallRegular.copyWith(color: Cr.accentBlue1),
            ),
          ),
          Di.DD,
          Di.SBHS,
          Center(
            child: SizedBox(
              width: isMobile ? Di.getScreenSize(context).width - 52 : 320,
              height: 35,
              child: const TextWithBackground(
                sizedBoxBetweenIconText: Di.SBWES,
                text: "Grow your network",
                iconData: Icons.person_add,
                backgroundColor: Cr.accentBlue3,
              ),
            ),
          ),
          Di.SBHD,
        ],
      ),
    );
  }
}
