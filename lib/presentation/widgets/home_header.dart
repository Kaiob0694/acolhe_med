import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'acolhemed_logo.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.patientName,
    required this.notifications,
    required this.onNotificationsTap,
  });

  final String patientName;
  final int notifications;
  final VoidCallback onNotificationsTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AcolheMedLogo(),
            _NotificationButton(
              count: notifications,
              onTap: onNotificationsTap,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text('${AppStrings.greeting}, $patientName!',
            style: AppTextStyles.greeting),
        const SizedBox(height: 2),
        const Padding(
          padding: EdgeInsets.only(left: 3),
          child: SizedBox(
            width: 190,
            child: Text(AppStrings.howCanWeHelp,
                style: AppTextStyles.greetingSub),
          ),
        ),
      ],
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton({required this.count, required this.onTap});

  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.45),
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: SizedBox(
          width: 64,
          height: 64,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.notifications_none,
                  size: 32, color: Colors.white.withValues(alpha: 0.9)),
              if (count > 0)
                Positioned(
                  top: 14,
                  right: 16,
                  child: Container(
                    width: 14,
                    height: 14,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.badge,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$count',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
