// models.dart
class University {
  String alphaTwoCode;
  String country;
  String stateProvince;
  List<String> domains;
  String name;
  List<String> webPages;

  University({
    required this.alphaTwoCode,
    required this.country,
    required this.stateProvince,
    required this.domains,
    required this.name,
    required this.webPages,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      alphaTwoCode: json['alpha_two_code'] ?? '',
      country: json['country'] ?? '',
      stateProvince: json['state-province'] ?? '',
      domains: List<String>.from(json['domains']),
      name: json['name'] ?? '',
      webPages: List<String>.from(json['web_pages']),
    );
  }

  @override
  String toString() =>
      'University(name: $name, country: $country, alphaTwoCode: $alphaTwoCode, stateProvince: $stateProvince, domains: ${domains.map((e) => e)} and length ${domains.length}, webPages: ${webPages.map((e) => e)} and length ${webPages.length})';
}
