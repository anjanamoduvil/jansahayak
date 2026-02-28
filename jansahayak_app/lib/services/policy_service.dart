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

      if (category != null && 
          category.trim().isNotEmpty && 
          category.trim() != 'Other' && 
          category.trim() != 'All') {
        final normalizedCategory = category.trim().toLowerCase();
        schemes = schemes
            .where((s) => s.category.toLowerCase().contains(normalizedCategory))
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
    final stopWords = {'schemes', 'government', 'policy', 'help', 'with', 'about', 'find', 'show', 'list'};
    final queryWords = lowerQuery
        .split(RegExp(r'[\s,.\?\!]+'))
        .where((w) => w.length >= 3 && !stopWords.contains(w))
        .toList();
    
    if (queryWords.isEmpty && lowerQuery.isNotEmpty) {
      queryWords.add(lowerQuery);
    }

    return schemes.where((s) {
      final name = s.name.toLowerCase();
      final desc = s.description.toLowerCase();
      final cat = s.category.toLowerCase();
      final state = s.state.toLowerCase();

      for (final word in queryWords) {
        // Use word boundary to avoid "hi" matching "this"
        final regExp = RegExp('\\b${RegExp.escape(word)}\\b', caseSensitive: false);
        if (regExp.hasMatch(name) || 
            regExp.hasMatch(desc) || 
            regExp.hasMatch(cat) || 
            regExp.hasMatch(state)) {
          return true;
        }
      }
      return false;
    }).toList();
  }
}