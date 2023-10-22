import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unisearch/src/features/auth/presentation/intro/intro_screen.dart';
import 'package:unisearch/src/features/university/university_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UniversityProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: true, textTheme: GoogleFonts.dmSansTextTheme()),
          home: const IntroScreen()),
    );
  }
}
