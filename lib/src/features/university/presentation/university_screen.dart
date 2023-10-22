import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:unisearch/src/features/university/domain/university.dart';

class UniversityScreen extends StatelessWidget {
  final University university;
  const UniversityScreen({super.key, required this.university});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(university.name),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                university.name,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 20),
              Text(
                "Web Pages",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              for (String webPage in university.webPages)
                Text(
                  webPage,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              const SizedBox(height: 20),
              Text(
                "Domains",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              for (String domain in university.domains)
                Text(
                  domain,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              const Spacer(),
              Text(
                "${university.country} - ${university.alphaTwoCode}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20)
            ].animate(delay: 300.ms).fadeIn(duration: 500.ms),
          ),
        ),
      ),
    );
  }
}
