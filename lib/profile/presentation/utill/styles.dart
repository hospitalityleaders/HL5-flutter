import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';

final List<BoxShadow> defaultBoxShadow = [
  const BoxShadow(
    color: Cr.darkGrey3,
    spreadRadius: -1,
    offset: Offset(0, 2), // changes position of shadow
  ),
];

final InputDecoration popUpDialogTextFieldInputDecoration = InputDecoration(
  isDense: true,
  contentPadding: const EdgeInsets.symmetric(
    vertical: 13.0,
    horizontal: 10,
  ),

  // border: InputBorder.none,
  border: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Cr.darkGrey4,
    ),
    borderRadius: BorderRadius.circular(2),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Cr.darkGrey4,
    ),
    borderRadius: BorderRadius.circular(2),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Cr.accentBlue1,
    ),
    borderRadius: BorderRadius.circular(2),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Cr.darkGrey4,
    ),
    borderRadius: BorderRadius.circular(2),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(
      color: Cr.darkGrey4,
    ),
    borderRadius: BorderRadius.circular(2),
  ),
);

InputDecoration popUpDialogTextFieldInputDecorationFunction([
  Color? borderColor,
  Widget? prefixIcon,
]) =>
    InputDecoration(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 13.0,
        horizontal: 10,
      ),
      prefixIcon: prefixIcon,

      // border: InputBorder.none,
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Cr.darkGrey4,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Cr.darkGrey4,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Cr.accentBlue1,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Cr.darkGrey4,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Cr.darkGrey4,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
    );

const BoxDecoration boxDecorationBorder = BoxDecoration(
  color: Cr.whiteColor,
  border: Border(
    bottom: BorderSide(
      color: Cr.darkGrey1,
    ),
  ),
);
final BoxDecoration boxDecorationRounded = BoxDecoration(
  color: Cr.whiteColor,
  borderRadius: BorderRadius.circular(4),
);

const BoxDecoration boxDecorationCircle = BoxDecoration(
  color: Cr.whiteColor,
  shape: BoxShape.circle,
);

final BoxDecoration boxDecoration = BoxDecoration(
  color: Cr.whiteColor,
  boxShadow: defaultBoxShadow,
);
final BoxDecoration boxDecorationWithShadow = BoxDecoration(
  color: Cr.whiteColor,
  boxShadow: defaultBoxShadow,
);

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
  height: 1.375,
);

const bodyExtraSmall = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSES,
  color: Cr.darkBlue1,
);

const bodySmallRegular = TextStyle(
  fontFamily: 'SourceSansPro',
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: Cr.darkBlue1,
  height: 1.42,
);

const bodySmallSemibold = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: Cr.darkBlue1,
);

const h2Regular = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSEL,
  fontWeight: FontWeight.w400,
  color: Cr.darkBlue1,
  height: 1.2,
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
  fontSize: Di.FSL - 2,
  fontWeight: FontWeight.bold,
  color: Cr.darkBlue1,
  height: 1.25,
);

const h5Bold = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Cr.darkBlue1,
  height: 1.29,
);

// Divider Text Small OR IMPORT YOUR DETAILS FROM

const dividerTextSmall = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSS,
  fontWeight: FontWeight.bold,
  color: Cr.darkBlue1,
);

const dividerTextLarge = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: Di.FSS + 1,
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
