import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe Card',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        cardTheme: CardTheme(
          color: const Color(0xff25282B).withOpacity(0.95),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xff373c3f),
          ),
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              headlineSmall: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
              titleMedium: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
              titleLarge: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.grey, fontSize: 16),
            ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        cardTheme: const CardTheme(
          color: Color(0xffBEC9D4),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black87,
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              titleLarge: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.grey, fontSize: 16),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
