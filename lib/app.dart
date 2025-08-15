import 'package:admin/common/constants.dart';
import 'package:admin/home/cubit/menu_app_cubit.dart';
import 'package:admin/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: BlocProvider<MenuAppCubit>(
        create: (context) => MenuAppCubit(),
        child: HomeScreen(),
      ),
      // home: MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(create: (context) => MenuAppController()),
      //   ],
      //   child: HomeScreen(),
      // ),
    );
  }
}
