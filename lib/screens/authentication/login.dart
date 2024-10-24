import 'package:admin/screens/authentication/desktop.dart';
import 'package:admin/screens/authentication/mobile.dart';
import 'package:admin/screens/authentication/mobile_menu.dart';
import 'package:admin/screens/authentication/nav_bar.dart';
import 'package:admin/screens/authentication/responsive_widget.dart';
import 'package:admin/screens/authentication/style.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? mobileTopBar(scaffoldKey)
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: NavBar(),
              ),
        drawer: MobileMenu(),
        backgroundColor: bgColor,
        body: ResponsiveWidget(
          largeScreen: DesktopScreen(),
          smallScreen: MobileScreen(),
        ));
  }
  
  mobileTopBar(GlobalKey<ScaffoldState> scaffoldKey) {}
}
