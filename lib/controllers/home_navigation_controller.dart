import 'package:flutter/material.dart';

class HomeNavigationController extends ChangeNotifier {
  int _screenNumber = 0; // Initialize to zero by default

  // Getter for screenNumber
  int get screenNumber => _screenNumber;

  // Setter for screenNumber
  set screenNumber(int value) {
    if (_screenNumber != value) {
      _screenNumber = value;
      notifyListeners(); // Notify listeners when the value changes
    }
  }
}
