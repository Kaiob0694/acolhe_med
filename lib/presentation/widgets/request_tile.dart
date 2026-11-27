import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/date_utils.dart';
import '../../data/models/patient_request.dart';

class RequestTile extends StatelessWidget {
  const RequestTile({super.key, required this.request});

  final PatientRequest request;

  @override
  Widget build(BuildContext context) {
    final attended = request.status == RequestStatus.attended;
    final background =
        attended ? AppColors.successBackground : AppColors.pendingBackground;
    final iconColor =
        attended ? AppColors.successIcon : AppColors.pendingIcon;
    final dayLabel = AppDateUtils.isToday(request.createdAt)
        ? AppStrings.today
        : AppDateUtils.formatDate(request.createdAt);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
            child: Icon(
              attended ? Icons.check : Icons.schedule,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(request.status.label, style: AppTextStyles.requestTitle),
                Text(
                  '${request.description} às '
                  '${AppDateUtils.formatTime(request.createdAt)}',
                  style: AppTextStyles.requestSubtitle,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              dayLabel,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF444444),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
