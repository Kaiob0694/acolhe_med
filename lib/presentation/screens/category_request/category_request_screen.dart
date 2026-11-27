import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/models/request_category.dart';

/// Tela genérica de solicitação: lista as opções da categoria
/// e devolve (pop) a descrição escolhida para a tela anterior.
class CategoryRequestScreen extends StatefulWidget {
  const CategoryRequestScreen({super.key, required this.category});

  final RequestCategory category;

  @override
  State<CategoryRequestScreen> createState() => _CategoryRequestScreenState();
}

class _CategoryRequestScreenState extends State<CategoryRequestScreen> {
  final _noteController = TextEditingController();
  String? _selected;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _submit() {
    final selected = _selected;
    if (selected == null) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(const SnackBar(content: Text(AppStrings.selectOption)));
      return;
    }
    final note = _noteController.text.trim();
    final description = note.isEmpty ? selected : '$selected ($note)';
    Navigator.pop(context, description);
  }

  @override
  Widget build(BuildContext context) {
    final category = widget.category;
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Text(
                    category.subtitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textTitle,
                    ),
                  ),
                  const SizedBox(height: 16),
                  for (final option in category.options)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: _OptionTile(
                        label: option,
                        selected: option == _selected,
                        onTap: () => setState(() => _selected = option),
                      ),
                    ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _noteController,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      hintText: AppStrings.observationHint,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: FilledButton(
                onPressed: _submit,
                child: const Text(AppStrings.sendRequest),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.successBackground : AppColors.card,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? AppColors.green : AppColors.cardBorder,
              width: selected ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(label, style: const TextStyle(fontSize: 16)),
              ),
              if (selected)
                const Icon(Icons.check_circle, color: AppColors.green),
            ],
          ),
        ),
      ),
    );
  }
}
