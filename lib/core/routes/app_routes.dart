import 'package:flutter/material.dart';

import '../../data/models/request_category.dart';
import '../../presentation/screens/category_request/category_request_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/requests/requests_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const home = '/';
  static const categoryRequest = '/solicitar';
  static const requests = '/solicitacoes';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case categoryRequest:
        final category = settings.arguments as RequestCategory;
        return MaterialPageRoute<String>(
          builder: (_) => CategoryRequestScreen(category: category),
          settings: settings,
        );
      case requests:
        return MaterialPageRoute<void>(
          builder: (_) => const RequestsScreen(),
          settings: settings,
        );
      case home:
      default:
        return MaterialPageRoute<void>(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
    }
  }
}
