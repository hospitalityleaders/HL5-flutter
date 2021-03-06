import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';

class Di {
  // Font Size can be also used for icon size
  static const double FSES = 10.0;
  static const double FSS = 12.0;
  static const double FSD = 16.0;
  static const double FSL = 18.0;
  static const double FSEL = 20.0;
  static const double FSOL = 24.0;
  static const double FSOTL = 32.0;
  static const double FSD1 = 48.0;
  static const double FSD2 = 40.0;

  // Width Size
  static const double WSETS = 50.0;
  static const double WSES = 100.0;
  static const double WSS = 150.0;
  static const double WSD = 200.0;
  static const double WSL = 250.0;
  static const double WSEL = 300.0;
  static const double WSOL = 350.0;
  static const double WSOTL = 400.0;

  // SizedBox Width
  static const SizedBox ESB = SizedBox();
  static const SizedBox SBWETS = SizedBox(width: PSETS);
  static const SizedBox SBWES = SizedBox(width: PSES);
  static const SizedBox SBWS = SizedBox(width: PSS);
  static const SizedBox SBWD = SizedBox(width: PSD);
  static const SizedBox SBWL = SizedBox(width: PSL);
  static const SizedBox SBWEL = SizedBox(width: PSEL);
  static const SizedBox SBWOL = SizedBox(width: PSOL);
  static const SizedBox SBWOTL = SizedBox(width: PSOTL);
  static SizedBox SBCW(double width) => SizedBox(width: width);

  // SizedBox Height
  static const SizedBox SBHETS = SizedBox(height: PSETS);
  static const SizedBox SBHES = SizedBox(height: PSES);
  static const SizedBox SBHS = SizedBox(height: PSS);
  static const SizedBox SBHD = SizedBox(height: PSD);
  static const SizedBox SBHL = SizedBox(height: PSL);
  static const SizedBox SBHEL = SizedBox(height: PSEL);
  static const SizedBox SBHOL = SizedBox(height: PSOL);
  static const SizedBox SBHOTL = SizedBox(height: PSOTL);
  static SizedBox SBCH(double height) => SizedBox(height: height);

  // Radius Size
  static const double RSETS = 4.0;
  static const double RSD = 18.0;

  // Padding size
  static const double PSETS = 2.0;
  static const double PSES = 5.0;
  static const double PSS = 10.0;
  static const double PSD = 15.0;
  static const double PSL = 20.0;
  static const double PSEL = 25.0;
  static const double PSOL = 30.0;
  static const double PSOTL = 35.0;

  static const Divider DD = Divider(thickness: 1);
  static const Divider DD2 = Divider(
    thickness: .7,
    color: Cr.darkGrey2,
  );

  static const Divider DWZH = Divider(
    thickness: 1,
    height: 0,
  );

  static const Divider DHDT = Divider(
    thickness: 2,
    height: 0,
  );
  static const VerticalDivider DVZW = VerticalDivider(
    thickness: 2,
    width: 0,
  );

  static const int MESSAGE_INPUT_LENGTH = 250;
  static const double NOTIFICATION_IMAGE_SIZE = 70.0;
  static const double WEB_SCREEN_WIDTH = 1170.0;

  static Size getScreenSize(BuildContext context) =>
      MediaQuery.of(context).size;
}
