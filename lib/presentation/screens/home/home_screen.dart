import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/request_category.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/category_card.dart';
import '../../widgets/emergency_button.dart';
import '../../widgets/home_header.dart';
import '../../widgets/patient_info_card.dart';
import '../../widgets/request_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openCategory(RequestCategory category) async {
    final result = await Navigator.pushNamed<Object?>(
      context,
      AppRoutes.categoryRequest,
      arguments: category,
    );
    if (result is String) {
      await _controller.sendRequest(category, result);
      if (!mounted) return;
      _showMessage(AppStrings.requestSent);
    }
  }

  Future<void> _confirmEmergency() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(AppStrings.emergencyTitle),
        content: const Text(AppStrings.emergencyMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text(AppStrings.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.badge,
              minimumSize: const Size(110, 44),
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text(AppStrings.confirm),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await _controller.sendEmergency();
    if (!mounted) return;
    _showMessage(AppStrings.emergencySent);
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          final patient = _controller.patient;
          if (_controller.loading || patient == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Container(
            decoration:
                const BoxDecoration(gradient: AppColors.headerGradient),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeader(
                      patientName: patient.name,
                      notifications: _controller.unreadNotifications,
                      onNotificationsTap: _controller.clearNotifications,
                    ),
                    const SizedBox(height: 24),
                    PatientInfoCard(patient: patient),
                    const SizedBox(height: 28),
                    _CategoryGrid(onTap: _openCategory),
                    const SizedBox(height: 24),
                    EmergencyButton(onPressed: _confirmEmergency),
                    const SizedBox(height: 28),
                    _RequestsSection(controller: _controller),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid({required this.onTap});

  final ValueChanged<RequestCategory> onTap;

  @override
  Widget build(BuildContext context) {
    const spacing = 14.0;
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = (constraints.maxWidth - spacing) / 2;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final category in RequestCategory.values)
              SizedBox(
                width: itemWidth,
                child: CategoryCard(
                  category: category,
                  onTap: () => onTap(category),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _RequestsSection extends StatelessWidget {
  const _RequestsSection({required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final latest = controller.requests.take(3).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(AppStrings.myRequests, style: AppTextStyles.section),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.requests),
              child: const Row(
                children: [
                  Text(AppStrings.seeAll, style: AppTextStyles.link),
                  Icon(Icons.chevron_right, size: 18, color: AppColors.link),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (latest.isEmpty)
          const Text(AppStrings.noRequests)
        else
          for (final request in latest)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RequestTile(request: request),
            ),
      ],
    );
  }
}
