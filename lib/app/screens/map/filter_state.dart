import 'package:flutter/foundation.dart';

class FilterState extends ChangeNotifier {
  final Set<String> _activeFilters = {};

  Set<String> get activeFilters => _activeFilters;

  void addFilter(String filter) {
    _activeFilters.add(filter);
    notifyListeners();
  }

  void removeFilter(String filter) {
    _activeFilters.remove(filter);
    notifyListeners();
  }
}

