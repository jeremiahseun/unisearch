import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:unisearch/src/features/university/presentation/search_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.00, 0.04),
          end: Alignment(-1, -0.04),
          colors: [
            Color.fromARGB(255, 126, 3, 77),
            Color.fromARGB(255, 62, 2, 25)
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const Spacer(),
            Text(
              'Welcome to the UniSearch!',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ).animate(delay: 600.ms).fadeIn().moveY(),
            const Gap(30),
            Text(
              'Click the button to get started',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white),
            ).animate(delay: 1200.ms).fadeIn(),
            const Spacer(),
            EasyContainer(
              child: const Text("Get Started"),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchScreen())),
            ).animate(delay: 2000.ms).fadeIn().moveY(begin: 40),
            const Gap(40)
          ]),
        ),
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}
