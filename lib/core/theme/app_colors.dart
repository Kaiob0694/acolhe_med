import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Marca
  static const blue = Color(0xFF0B3C8C);
  static const blueLight = Color(0xFF0A6CF0);
  static const blueDark = Color(0xFF062F6E);
  static const green = Color(0xFF16A34A);
  static const greenDark = Color(0xFF0F5C3A);
  static const greenLight = Color(0xFF00C46A);

  // Superfícies
  static const background = Color(0xFFEBEBEB);
  static const headerTop = Color(0xFFBFD9F5);
  static const card = Color(0xFFF2F2F2);
  static const cardBorder = Color(0xFFDDDDDD);

  // Textos
  static const textTitle = Color(0xFF0B3C8C);
  static const textSubtitle = Color(0xFF3A3A3A);
  static const textSection = Color(0xFF0F5C3A);

  // Estados
  static const successBackground = Color(0xFFD5F0D8);
  static const successIcon = Color(0xFF5CE07A);
  static const pendingBackground = Color(0xFFFFF3CD);
  static const pendingIcon = Color(0xFFF5B301);
  static const badge = Color(0xFFB00020);
  static const link = Color(0xFF0A7AFF);

  // Gradientes
  static const blueGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [blueLight, blueDark],
  );

  static const greenGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [green, greenDark],
  );

  static const emergencyGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [blueLight, blueDark, greenLight],
    stops: [0.0, 0.45, 1.0],
  );

  static const headerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [headerTop, background],
  );
}
