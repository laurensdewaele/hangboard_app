import 'package:flutter/cupertino.dart';

import 'package:app/styles/styles.dart' as styles;

abstract class Staatliches {
  // Outliers
  static const TextStyle countdownTimer = TextStyle(
      fontFamily: 'Staatliches', fontSize: 400, color: styles.Colors.white);
  static const TextStyle difficulty = TextStyle(
      fontFamily: 'Staatliches', fontSize: 26, color: styles.Colors.white);
  static const TextStyle textDivider = TextStyle(
      fontFamily: 'Staatliches', fontSize: 4, color: styles.Colors.black);

  // Standard
  static const TextStyle xlWhite = TextStyle(
      fontFamily: 'Staatliches', fontSize: 28, color: styles.Colors.white);
  static const TextStyle xlBlack = TextStyle(
      fontFamily: 'Staatliches', fontSize: 28, color: styles.Colors.black);
  static const TextStyle lWhite = TextStyle(
      fontFamily: 'Staatliches', fontSize: 22, color: styles.Colors.white);
  static const TextStyle lBlack = TextStyle(
      fontFamily: 'Staatliches', fontSize: 22, color: styles.Colors.black);
  static const TextStyle mWhite = TextStyle(
      fontFamily: 'Staatliches', fontSize: 20, color: styles.Colors.white);
  static const TextStyle mBlack = TextStyle(
      fontFamily: 'Staatliches', fontSize: 20, color: styles.Colors.black);
  static const TextStyle sWhite = TextStyle(
      fontFamily: 'Staatliches', fontSize: 18, color: styles.Colors.white);
  static const TextStyle xsBlack = TextStyle(
      fontFamily: 'Staatliches', fontSize: 16, color: styles.Colors.black);
  static const TextStyle xsWhite = TextStyle(
      fontFamily: 'Staatliches', fontSize: 16, color: styles.Colors.white);
  static const TextStyle xsGray = TextStyle(
      fontFamily: 'Staatliches', fontSize: 16, color: styles.Colors.gray);
  static const TextStyle xsLightGray = TextStyle(
      fontFamily: 'Staatliches', fontSize: 16, color: styles.Colors.lightGray);
}

abstract class Lato {
  // Lato - bold
  static const TextStyle lBlackBold = TextStyle(
      fontFamily: 'Lato',
      fontSize: 22,
      color: styles.Colors.black,
      fontWeight: FontWeight.w700);
  static const TextStyle sBlackBold = TextStyle(
      fontFamily: 'Lato',
      fontSize: 18,
      color: styles.Colors.black,
      fontWeight: FontWeight.w700);

  // Lato - regular
  static const TextStyle sBlack =
      TextStyle(fontFamily: 'Lato', fontSize: 18, color: styles.Colors.black);
  static const TextStyle xsBlack =
      TextStyle(fontFamily: 'Lato', fontSize: 16, color: styles.Colors.black);
  static const TextStyle xsGray =
      TextStyle(fontFamily: 'Lato', fontSize: 16, color: styles.Colors.gray);
  static const TextStyle xsWhite =
      TextStyle(fontFamily: 'Lato', fontSize: 16, color: styles.Colors.bgWhite);
  static const TextStyle xsPrimary =
      TextStyle(fontFamily: 'Lato', fontSize: 16, color: styles.Colors.primary);
  static const TextStyle xsBlue =
      TextStyle(fontFamily: 'Lato', fontSize: 16, color: styles.Colors.blue);
}
