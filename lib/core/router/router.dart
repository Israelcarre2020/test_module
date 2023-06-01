import 'package:flutter/material.dart';

import '../../pages/Home/home_page.dart';
import '../../pages/no_found/not_fount_page.dart';
import 'app_routes.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
