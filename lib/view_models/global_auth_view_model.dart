import 'package:flutter/widgets.dart';

class GlobalUIViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  loadState(bool _state) {
    _isLoading = _state;
    notifyListeners();
  }
}
