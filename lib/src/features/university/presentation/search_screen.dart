import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:unisearch/src/features/university/university_provider.dart';

import 'university_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "US Universities Search",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const Gap(30),
                  TextFormField(
                    focusNode: focusNode,
                    controller: controller,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        return;
                      }
                      context
                          .read<UniversityProvider>()
                          .searchUniversity(value);
                    },
                    decoration: const InputDecoration(
                        hintText: 'Type in a school name...',
                        border: OutlineInputBorder()),
                  ),
                  const Gap(50),
                  Builder(builder: (context) {
                    return Consumer<UniversityProvider>(
                        builder: (context, university, _) {
                      return Visibility(
                        visible: controller.text.isNotEmpty &&
                            university.universities.isNotEmpty,
                        replacement: const Center(
                            child: Text(
                          "Your search results will show here. \nClick on a search result to show more details.",
                          textAlign: TextAlign.center,
                        )),
                        child: Visibility(
                            visible: !university.isLoading,
                            replacement:
                                const CircularProgressIndicator.adaptive(),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: university.universities.length,
                              itemBuilder: (context, i) {
                                return ListTile(
                                  title: Text(
                                    university.universities[i].name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                      university.universities[i].country,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                  onTap: () {
                                    focusNode.unfocus();
                                    log('Selected ${university.universities[i].toString()}');
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UniversityScreen(
                                                    university: university
                                                        .universities[i])));
                                  },
                                ).animate(delay: 300.ms).fade(duration: 400.ms);
                              },
                              separatorBuilder: (_, i) {
                                return const Divider();
                              },
                            )),
                      );
                    });
                  })
                ],
              ),
            )),
      ),
    );
  }
}
