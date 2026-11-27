import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const greeting = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w800,
    color: AppColors.textTitle,
    height: 1.1,
  );

  static const greetingSub = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textTitle,
  );

  static const infoLabel = TextStyle(
    fontSize: 11,
    color: AppColors.textSubtitle,
  );

  static const infoValue = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.greenDark,
  );

  static const categoryTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.textTitle,
  );

  static const categorySubtitle = TextStyle(
    fontSize: 11,
    color: AppColors.textSubtitle,
  );

  static const emergency = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const section = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textSection,
  );

  static const link = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.link,
  );

  static const requestTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: Color(0xFF2B2B2B),
  );

  static const requestSubtitle = TextStyle(
    fontSize: 12,
    color: Color(0xFF555555),
  );
}
