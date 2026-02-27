import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/scheme.dart';

class PolicyService {
  PolicyService();

  Future<List<Scheme>> fetchSchemes({String? category}) async {
    try {
      final String response =
          await rootBundle.loadString('assets/data/dummy_schemes.json');
      final data = jsonDecode(response) as List;
      List<Scheme> schemes = data.map((e) => Scheme.fromJson(e)).toList();

      if (category != null && category.isNotEmpty) {
        schemes = schemes
            .where((s) => s.category.toLowerCase() == category.toLowerCase())
            .toList();
      }
      return schemes;
    } catch (e) {
      throw Exception('Failed to load local schemes: $e');
    }
  }

  Future<Scheme> fetchScheme(String id) async {
    final schemes = await fetchSchemes();
    return schemes.firstWhere((element) => element.id == id);
  }

  Future<List<Scheme>> chatbotSearch(
      {required String query, Map<String, dynamic>? profile}) async {
    final schemes = await fetchSchemes();
    final lowerQuery = query.toLowerCase();
    return schemes.where((s) {
      return s.name.toLowerCase().contains(lowerQuery) ||
          s.description.toLowerCase().contains(lowerQuery) ||
          s.category.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}