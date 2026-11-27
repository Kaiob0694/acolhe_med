import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/date_utils.dart';
import '../../data/models/patient.dart';

class PatientInfoCard extends StatelessWidget {
  const PatientInfoCard({super.key, required this.patient});

  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            const Icon(Icons.bed, size: 38, color: AppColors.greenDark),
            const SizedBox(width: 12),
            const VerticalDivider(width: 1, thickness: 1),
            const SizedBox(width: 12),
            Expanded(
              child: _InfoItem(label: AppStrings.bed, value: patient.bed),
            ),
            const Icon(Icons.calendar_month,
                size: 38, color: AppColors.greenDark),
            const SizedBox(width: 12),
            const VerticalDivider(width: 1, thickness: 1),
            const SizedBox(width: 12),
            Expanded(
              child: _InfoItem(
                label: AppStrings.admission,
                value: AppDateUtils.formatDate(patient.admissionDate),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: AppTextStyles.infoLabel),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(value, style: AppTextStyles.infoValue),
        ),
      ],
    );
  }
}
