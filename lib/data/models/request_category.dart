import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Categorias de solicitação exibidas na tela inicial.
enum RequestCategory {
  necessidade(
    title: 'Necessidade',
    subtitle: 'Precisa de atendimento?',
    icon: Icons.front_hand_outlined,
    gradient: AppColors.blueGradient,
    options: [
      'Ir ao banheiro',
      'Trocar fralda / roupa de cama',
      'Preciso de ajuda para me higienizar',
      'Outra necessidade',
    ],
  ),
  comodidade(
    title: 'Comodidade',
    subtitle: 'Conte como está se sentindo',
    icon: Icons.inventory_2_outlined,
    gradient: AppColors.greenGradient,
    options: [
      'Água',
      'Cobertor',
      'Travesseiro',
      'Ajustar temperatura do quarto',
      'Apagar / acender a luz',
    ],
  ),
  dor(
    title: 'Dor',
    subtitle: 'Precisa de atendimento?',
    icon: Icons.sentiment_dissatisfied_outlined,
    gradient: AppColors.blueGradient,
    options: [
      'Dor leve',
      'Dor moderada',
      'Dor forte',
      'Náusea / enjoo',
    ],
  ),
  comunicacao(
    title: 'Comunicação',
    subtitle: 'Conte como está se sentindo',
    icon: Icons.forum_outlined,
    gradient: AppColors.greenGradient,
    options: [
      'Falar com o enfermeiro',
      'Falar com o médico',
      'Ligar para um familiar',
      'Tirar uma dúvida',
    ],
  ),
  mobilidade(
    title: 'Mobilidade',
    subtitle: 'Precisa de atendimento?',
    icon: Icons.accessible_outlined,
    gradient: AppColors.blueGradient,
    options: [
      'Ajuda para levantar da cama',
      'Ajuda para caminhar',
      'Cadeira de rodas',
      'Mudar de posição na cama',
    ],
  );

  final String title;
  final String subtitle;
  final IconData icon;
  final Gradient gradient;
  final List<String> options;

  const RequestCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.gradient,
    required this.options,
  });
}
