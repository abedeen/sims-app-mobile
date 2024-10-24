// menu_app_controller.dart

import 'package:admin/screens/dashboard/bookings_screen.dart';
import 'package:flutter/material.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';

class MenuAppController with ChangeNotifier {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Initialize currentScreen to your default screen
  Widget currentScreen = BookingsScreen();

  //DashboardScreen();

  // Method to change the screen
  void changeScreen(Widget screen) {
    currentScreen = screen;
    notifyListeners(); // Notify listeners to rebuild widgets
  }

  // Existing method to control the menu
  void controlMenu() {
    if (!scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openDrawer();
    }
  }
}
