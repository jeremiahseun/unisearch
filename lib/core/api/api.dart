import 'dart:developer';

import 'package:http/http.dart' as http;

class UniApi {
  Future<http.Response> searchSchool({required String schoolName}) async {
    log("Sending a GET request for $schoolName");
    final path = '/search?name=$schoolName&country=United+States';
    final url = Uri.parse('http://universities.hipolabs.com$path');
    final response = await http.get(url);
    log("Response from a GET request ${response.statusCode}");
    return response;
  }
}
