import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';

/// Mostra o logo de assets/images/logo.png.
/// Enquanto o arquivo não existir, exibe um logo provisório em texto.
class AcolheMedLogo extends StatelessWidget {
  const AcolheMedLogo({super.key, this.height = 52});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.logo,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite, color: AppColors.green, size: height * 0.7),
          const SizedBox(width: 6),
          const Text(
            AppStrings.appName,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
