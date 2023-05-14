import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static const Color white = Colors.white;

  static const Color bottomAppBarColor = Color(0xffFFB849);

  static TextColor textColor = TextColor();

  static PrimaryColor primaryLight = const PrimaryColor(
    0xffFFFFFF,
    <int, Color>{
      100: Colors.white,
      50: Color(0xFFF6F7FB),
    },
  );
}

class PrimaryColor extends ColorSwatch<int> {
  const PrimaryColor(super.primary, super.swatch);

  Color get shade100 => this[100]!;

  Color get shade50 => this[50]!;
}

class TextColor extends ColorSwatch<int> {
  TextColor()
      : super(0xff000000, <int, Color>{
          100: const Color(0xff000000),
          75: const Color(0xff404B63),
          50: const Color(0xff595858),
          25: const Color(0xffB8C0C9),
        });

  Color get shade100 => this[100]!;
  Color get shade75 => this[75]!;
  Color get shade50 => this[50]!;
  Color get shade25 => this[25]!;
}
