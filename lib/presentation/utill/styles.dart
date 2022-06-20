import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

class Styles {
  static final List<BoxShadow> boxShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      spreadRadius: 1,
      blurRadius: 7,
      offset: const Offset(0, 3), // changes position of shadow
    ),
  ];

  static final BoxDecoration boxDecorationBorder = BoxDecoration(
    color: Cr.whiteColor,
    border: Border(
      bottom: BorderSide(
        width: 1.0,
        color: Cr.darkGrey1,
      ),
    ),
  );
  static final BoxDecoration boxDecorationRounded = BoxDecoration(
    color: Cr.whiteColor,
    borderRadius: BorderRadius.circular(4),
  );

  static const BoxDecoration boxDecoration = BoxDecoration(
    color: Cr.whiteColor,
  );
  static final BoxDecoration boxDecorationWithShadow = BoxDecoration(
    color: Cr.whiteColor,
    boxShadow: Styles.boxShadow,
  );
}

// Display
const display1 = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSD1,
  fontWeight: FontWeight.w400,
  color: Cr.darkBlue1,
);

const display2 = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSD2,
  fontWeight: FontWeight.w400,
  color: Cr.darkBlue1,
);

const display3 = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 34,
  fontWeight: FontWeight.w400,
  color: Cr.darkBlue1,
);

// BodyLarge
const bodyLarge = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSD,
  color: Cr.darkBlue1,
);

const bodyExtraSmall = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSS - 2,
  color: Cr.darkBlue1,
);

const bodySmallRegular = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSD - 2,
  color: Cr.darkBlue1,
);

const bodySmallSemibold = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSD - 2,
  fontWeight: FontWeight.w600,
  color: Cr.darkBlue1,
);

const h2Regular = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSEL,
  fontWeight: FontWeight.w400,
  color: Cr.darkBlue1,
);

const h2Bold = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSEL,
  fontWeight: FontWeight.bold,
  color: Cr.darkBlue1,
);

const h3Bold = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSL,
  fontWeight: FontWeight.bold,
  color: Cr.darkBlue1,
);

const h4Bold = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSL,
  fontWeight: FontWeight.bold,
  color: Cr.darkBlue1,
);

const h5Bold = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSD - 2,
  fontWeight: FontWeight.bold,
  color: Cr.darkBlue1,
);

// Divider Text Small

const dividerTextSmall = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSS,
  fontWeight: FontWeight.bold,
  color: Cr.darkBlue1,
);

//
const defaultRegular = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: Di.FSD,
  fontWeight: FontWeight.w400,
  color: Cr.darkBlue1,
);

const defaultThin = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: Di.FSS,
  fontWeight: FontWeight.w200,
  color: Cr.darkBlue1,
);
const defaultSemiBold = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: Di.FSD,
  color: Cr.darkBlue1,
  fontWeight: FontWeight.w500,
);
const defaultMedium = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: Di.FSD,
  color: Cr.darkBlue1,
  fontWeight: FontWeight.w600,
);

const defaultBold = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: Di.FSD,
  fontWeight: FontWeight.w700,
);
const defaultExtraBold = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: Di.FSD,
  fontWeight: FontWeight.w900,
);
const defaultRegularLarge = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: Di.FSL,
  fontWeight: FontWeight.w700,
);

const defaultRegularOverTooLarge = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: Di.FSOTL,
  fontWeight: FontWeight.w700,
);
