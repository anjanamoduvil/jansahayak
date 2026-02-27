import 'package:flutter/foundation.dart';
import '../models/scheme.dart';
import '../services/policy_service.dart';

class SchemeProvider extends ChangeNotifier {
  SchemeProvider({PolicyService? service})
      : _service = service ?? PolicyService();

  final PolicyService _service;
  List<Scheme> _schemes = [];
  bool _loading = false;
  String? _error;

  List<Scheme> get schemes => _schemes;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> loadSchemes({String? category}) async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _schemes = await _service.fetchSchemes(category: category);
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}