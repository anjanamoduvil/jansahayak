class Scheme {
  final String id;
  final String name;
  final String category;
  final String description;
  final String eligibility;
  final List<String> documents;
  final String applyLink;
  final String state;

  const Scheme({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.eligibility,
    required this.documents,
    required this.applyLink,
    required this.state,
  });

  factory Scheme.fromJson(Map<String, dynamic> json) => Scheme(
        id: json['id'].toString(),
        name: json['name'] ?? '',
        category: json['category'] ?? '',
        description: json['description'] ?? '',
        eligibility: json['eligibility'] ?? '',
        documents:
            (json['documents'] as List?)?.map((e) => e.toString()).toList() ??
                const [],
        applyLink: json['applyLink'] ?? '',
        state: json['state'] ?? '',
      );
}