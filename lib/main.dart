import 'package:flutter/material.dart';
import 'loading_page.dart';
import 'home_screen.dart';

void main() {
  runApp(MaterialApp(home: const LoadingPage(), routes: {
    HomeScreen.id: (context) => const HomeScreen(),
  }));
}
