import 'package:admin/constants.dart';
import 'package:admin/controllers/menu_app_controller.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// 🛑 Import the new Login Screen 🛑
import 'package:admin/screens/login_screen.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      
      // 🛑 REPLACE 'home' with 'initialRoute' and 'routes' 🛑
      
      // 1. Define the starting point as the Login Screen route
      initialRoute: '/login', 
      
      // 2. Define all available screen routes
      routes: {
        // Route for the Login Screen
        '/login': (context) => const LoginScreen(), 
        
        // Route for the Main Dashboard Screen (requires the MenuAppController provider)
        '/dashboard': (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MenuAppController(),
            ),
          ],
          child: MainScreen(),
        ),
      },
    );
  }
}