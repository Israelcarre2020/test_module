import 'package:flutter/material.dart';

import 'core/router/app_routes.dart';
import 'core/router/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: AppRoutes.home,
      onGenerateRoute: MyRouter.generateRoute,
      title: 'Poc Flutter Inside Native With Project',
    );
  }
}
