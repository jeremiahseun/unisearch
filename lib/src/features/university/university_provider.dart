// university_provider.dart
import 'dart:convert';
import 'dart:developer';
import 'package:unisearch/core/api/api.dart';
import 'package:unisearch/core/notifier/notifier.dart';
import 'package:unisearch/src/features/university/domain/university.dart';

class UniversityProvider extends ListenNotifier {
  List<University> universities = [];
  String searchQuery = "";
  final api = UniApi();

  Future<void> searchUniversity(String query) async {
    startLoading();
    final response = await api.searchSchool(schoolName: query);
    stopLoading();
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      log(data.toString());
      universities =
          List<University>.from(data.map((item) => University.fromJson(item)));
      notifyListeners();
    }
  }
}
