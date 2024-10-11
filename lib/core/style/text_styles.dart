import 'package:flutter/material.dart';

abstract final class TextStyles {
  static const headline1Black = TextStyle(
    color: Colors.black,
    fontSize: 32.0,
  );

  static const headline2Black = TextStyle(
    color: Colors.black,
    fontSize: 28.0,
  );

  static const headline3Black = TextStyle(
    color: Colors.black,
    fontSize: 24.0,
  );

  static const headline2BlackItalic = TextStyle(
    color: Colors.black,
    fontStyle: FontStyle.italic,
    fontSize: 28.0,
  );

  static const bodyBlack = TextStyle(
    color: Colors.black,
    fontSize: 16.0,
  );

  static const bodyGrey = TextStyle(
    color: Colors.grey,
    fontSize: 16.0,
  );

  static const smallBodyBlack = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
  );
}
