import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: AppStrings.emergency,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        elevation: 4,
        child: Ink(
          height: 100,
          decoration: BoxDecoration(
            gradient: AppColors.emergencyGradient,
            borderRadius: BorderRadius.circular(24),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            onTap: onPressed,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.notifications_active_outlined,
                    color: Colors.white, size: 48),
                SizedBox(width: 12),
                Text(AppStrings.emergency, style: AppTextStyles.emergency),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
