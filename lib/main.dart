import 'package:flutter/material.dart';
import 'package:foodme_backend/config/theme.dart';

import 'screens/menu/menu_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodme Backend',
      theme: theme(),
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => const MenuScreen(),
        // '/dash': (context) => const DashboardScreen(),
        // '/opening-hours': (context) => const OpeningHoursScreen(),
      },
    );
  }
}
