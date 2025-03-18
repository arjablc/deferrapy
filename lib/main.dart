import 'package:defrappy/screens/favorite_screen.dart' show FavoriteScreen;
import 'package:defrappy/screens/homepage.dart';
import 'package:flutter/material.dart';

import 'screens/emoti_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: AppBarTheme(
          titleTextStyle: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/favorites': (context) => const FavoriteScreen(),
        '/tools': (context) => const ToolsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
