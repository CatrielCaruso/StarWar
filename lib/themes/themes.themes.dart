import 'package:flutter/material.dart';

class CustomStylesTheme {
  /// Colors

  static const MaterialColor primaryColor = MaterialColor(
    0xff053325, // primary
    <int, Color>{
      50: Color(0xff053325),
      100: Color(0xff053325),
      200: Color(0xff053325),
      300: Color(0xff053325),
      400: Color(0xff053325),
      500: Color(0xff053325),
      600: Color(0xff053325),
      700: Color(0xff053325),
      800: Color(0xff053325),
      900: Color(0xff053325),
    },
  );

  static const lightGreenColor = Color(0xff8BDC65);
  static const lightGreen20Color = Color(0xffe6f7df);
  static const lightGreen100Color = Color(0xffCEF4BD);
  static const lightGreen200Color = Color(0xffB6EE9C);
  static const lightGreen500Color = Color(0xff75C450);
  static const lightGreen700Color = Color(0xff4C8C2E);

  static const greenColor = Color(0xff00996B);
  static const green700Color = Color(0xff138361);
  static const green200Color = Color(0xff8BEDD0);
  static const green900Color = Color(0xff053325);

  static const whiteColor = Color(0xffFFFFFF);

  static const grayColor = Color(0x1414140a);
  static const gray100Color = Color(0xffF6F7FA);
  static const gray200Color = Color(0xffEAEBF2);
  static const gray300Color = Color(0xffDADBE4);
  static const gray500Color = Color(0xffABACB6);
  static const gray600Color = Color(0xff898B94);
  static const gray700Color = Color(0xff606168);
  static const gray800Color = Color(0xff313235);

  static const red1Color = Color(0xffFF5D43);
  static const red2Color = Color(0xffFF6D56);
  static const red3Color = Color(0xffFFAEA1);

  static const error50Color = Color(0xffFEF3F2);
  static const error700Color = Color(0xffB42318);

  static const secondaryRed0Color = Color(0xffFFEDEB);
  static const secondaryRed500Color = Color(0xffD32C12);
  static const secondaryRed600Color = Color(0xffBF2008);

  static const stateError200Color = Color(0xffFECDCA);
  static const stateError600Color = Color(0xffD92D20);

  static const lightBlue = Color(0xffACCAFF);
  static const secondaryLightBlue = Color(0xffEBF2FF);
  static const blueColor = Color(0xff1048A9);

  static const badgeBaseLightColor = Color(0xffD6EDFF);
  static const badgeBaseBlueColor = Color(0xff0044BA);

  static const blueLightColor = Color(0xff007AFF);

  static const overlayColor = Color(0xff000000);
  static const baseColor = Color(0xffCDCFD0);
  static const skyLightColor = Color(0xffE3E5E6);

  static const classicCredentialColor = Color(0xffEFDFBB);
  static const pmoCredentialColor = Color(0xffC5C7D1);

  static const secondaryLightBlue500Color = Color(0xff215DC5);

  /// Fonts
  /// tipo de fuente
  ///
  static const fontFamilyAlliance1 = 'Alliance No.1';
  static const fontFamilyAlliance2 = 'Alliance No.2';
  static const fontFamilyFranklin = 'Franklin';

  /// weight
  static const fontWeightMedium = FontWeight.w500;
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightBold = FontWeight.w700;

  /// estilos
  ///
  /// REGULAR
  /// DISPLAY
  static const displayL36_40 =
      TextStyle(fontSize: 36, fontFamily: fontFamilyAlliance1, height: 1.11);
  static const displayM32_40 =
      TextStyle(fontSize: 32, fontFamily: fontFamilyAlliance1, height: 1.25);
  static const displayS28_38 =
      TextStyle(fontSize: 28, fontFamily: fontFamilyAlliance1, height: 1.36);

  /// TITLE
  static const titleL24_28 =
      TextStyle(fontSize: 24, fontFamily: fontFamilyAlliance1, height: 1.17);
  static const titleM20_24 =
      TextStyle(fontSize: 20, fontFamily: fontFamilyAlliance1, height: 1.2);
  static const titleS18_22 =
      TextStyle(fontSize: 18, fontFamily: fontFamilyAlliance1, height: 1.22);
  static const titleXS16_20 =
      TextStyle(fontSize: 16, fontFamily: fontFamilyAlliance1, height: 1.25);
  static const titleXS16_18 =
      TextStyle(fontSize: 16, fontFamily: fontFamilyAlliance1, height: 1.12);

  /// BODY
  static const bodyL18_28 =
      TextStyle(fontSize: 18, fontFamily: fontFamilyAlliance1, height: 1.56);
  static const bodyM16_26 =
      TextStyle(fontSize: 16, fontFamily: fontFamilyAlliance1, height: 1.63);
  static const bodyS14_24 =
      TextStyle(fontSize: 14, fontFamily: fontFamilyAlliance1, height: 1.71);
  static const bodyXS12_22 =
      TextStyle(fontSize: 12, fontFamily: fontFamilyAlliance1, height: 1.83);

  /// SEMIBOLD
  ///
  /// DISPLAY
  // ignore: constant_identifier_names
  static const displayL36_40_semibold = TextStyle(
      fontSize: 36,
      fontFamily: fontFamilyAlliance1,
      height: 1.11,
      fontWeight: fontWeightSemiBold);
  // ignore: constant_identifier_names
  static const displayM32_40_semibold = TextStyle(
      fontSize: 32,
      fontFamily: fontFamilyAlliance1,
      // height: 1.25,
      fontWeight: fontWeightSemiBold);
  // ignore: constant_identifier_names
  static const displayS28_38_semibold = TextStyle(
      fontSize: 28,
      fontFamily: fontFamilyAlliance1,
      height: 1.36,
      fontWeight: fontWeightSemiBold);

  /// TITLE
  // ignore: constant_identifier_names
  static const titleL24_28_semibold = TextStyle(
      fontSize: 24,
      fontFamily: fontFamilyAlliance1,
      height: 1.17,
      fontWeight: fontWeightSemiBold);
  // ignore: constant_identifier_names
  static const titleM20_24_semibold = TextStyle(
      fontSize: 20,
      fontFamily: fontFamilyAlliance1,
      height: 1.2,
      fontWeight: fontWeightSemiBold);
  // ignore: constant_identifier_names
  static const titleS18_22_semibold = TextStyle(
      fontSize: 18,
      fontFamily: fontFamilyAlliance1,
      height: 1.22,
      fontWeight: fontWeightSemiBold);
  // ignore: constant_identifier_names
  static const titleXS16_20_semibold = TextStyle(
      fontSize: 16,
      fontFamily: fontFamilyAlliance1,
      height: 1.25,
      fontWeight: fontWeightSemiBold);
  // ignore: constant_identifier_names
  static const titleXS16_18_semibold = TextStyle(
      fontSize: 16,
      fontFamily: fontFamilyAlliance1,
      height: 1.12,
      fontWeight: fontWeightSemiBold);

  /// BODY
  // ignore: constant_identifier_names
  static const bodyL18_28_semibold = TextStyle(
      fontSize: 18,
      fontFamily: fontFamilyAlliance1,
      height: 1.56,
      fontWeight: fontWeightSemiBold);
  // ignore: constant_identifier_names
  static const bodyM16_26_semibold = TextStyle(
      fontSize: 16,
      fontFamily: fontFamilyAlliance1,
      height: 1.63,
      fontWeight: fontWeightSemiBold);
  // ignore: constant_identifier_names
  static const bodyS14_24_semibold = TextStyle(
      fontSize: 14,
      fontFamily: fontFamilyAlliance1,
      height: 1.71,
      fontWeight: fontWeightSemiBold);
  // ignore: constant_identifier_names
  static const bodyXS12_22_semibold = TextStyle(
      fontSize: 12,
      fontFamily: fontFamilyAlliance1,
      height: 1.83,
      fontWeight: fontWeightSemiBold);

  /// MEDIUM
  ///
  ///DISPLAY

  // ignore: constant_identifier_names
  static const displayL36_40_medium = TextStyle(
      fontSize: 36,
      fontFamily: fontFamilyAlliance1,
      height: 1.11,
      fontWeight: fontWeightMedium);
  // ignore: constant_identifier_names
  static const displayM32_40_medium = TextStyle(
      fontSize: 32,
      fontFamily: fontFamilyAlliance1,
      height: 1.25,
      fontWeight: fontWeightMedium);
  // ignore: constant_identifier_names
  static const displayS28_38_medium = TextStyle(
      fontSize: 28,
      fontFamily: fontFamilyAlliance1,
      height: 1.36,
      fontWeight: fontWeightMedium);

  /// TITLE
  // ignore: constant_identifier_names
  static const titleL24_28_medium = TextStyle(
      fontSize: 24,
      fontFamily: fontFamilyAlliance1,
      height: 1.17,
      fontWeight: fontWeightMedium);
  // ignore: constant_identifier_names
  static const titleM20_24_medium = TextStyle(
      fontSize: 20,
      fontFamily: fontFamilyAlliance1,
      height: 1.2,
      fontWeight: fontWeightMedium);
  // ignore: constant_identifier_names
  static const titleS18_22_medium = TextStyle(
      fontSize: 18,
      fontFamily: fontFamilyAlliance1,
      height: 1.22,
      fontWeight: fontWeightMedium);
  // ignore: constant_identifier_names
  static const titleXS16_20_medium = TextStyle(
      fontSize: 16,
      fontFamily: fontFamilyAlliance1,
      height: 1.25,
      fontWeight: fontWeightMedium);
  // ignore: constant_identifier_names
  static const titleXS16_16_medium = TextStyle(
      fontSize: 16,
      fontFamily: fontFamilyAlliance1,
      height: 1,
      fontWeight: fontWeightMedium);

  /// BODY
  // ignore: constant_identifier_names
  static const bodyL18_28_medium = TextStyle(
      fontSize: 18,
      fontFamily: fontFamilyAlliance1,
      height: 1.56,
      fontWeight: fontWeightMedium);
  // ignore: constant_identifier_names
  static const bodyM16_26_medium = TextStyle(
      fontSize: 16,
      fontFamily: fontFamilyAlliance1,
      height: 1.63,
      fontWeight: fontWeightMedium);
  // ignore: constant_identifier_names
  static const bodyS14_24_medium = TextStyle(
      fontSize: 14,
      fontFamily: fontFamilyAlliance1,
      height: 1.71,
      fontWeight: fontWeightMedium);
  // ignore: constant_identifier_names
  static const bodyXS12_22_medium = TextStyle(
      fontSize: 12,
      fontFamily: fontFamilyAlliance1,
      height: 1.83,
      fontWeight: fontWeightMedium);

  /// BOLD
  // ignore: constant_identifier_names
  static const titleXS16_20_bold = TextStyle(
    fontSize: 16,
    fontFamily: fontFamilyAlliance1,
    height: 1.25,
    fontWeight: fontWeightBold,
  );

  /// Custom Font
  ///
  static const font_12_12 = TextStyle(
    fontSize: 12,
    fontFamily: fontFamilyAlliance1,
    height: 1,
  );

  static const font_20_16 = TextStyle(
    fontSize: 20,
    fontFamily: fontFamilyAlliance1,
    height: 0.8,
  );

  static const font20_16semibold = TextStyle(
    fontSize: 20,
    fontFamily: fontFamilyAlliance1,
    height: 0.8,
    fontWeight: fontWeightSemiBold,
  );

  /// Theme
  ///
  ///
  static ThemeData mainTheme = ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    canvasColor: Colors.transparent,
    primarySwatch: CustomStylesTheme.primaryColor,
    scaffoldBackgroundColor: CustomStylesTheme.whiteColor,
  );
}
