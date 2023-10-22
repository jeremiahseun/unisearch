import 'package:flutter/material.dart';

class ListenNotifier with ChangeNotifier {
  bool isLoading = false;
  
  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }
}
