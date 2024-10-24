import 'package:admin/controllers/home_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart'; // Import Provider

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the HomeNavigationController
    final navigationController = Provider.of<HomeNavigationController>(context);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
           // Add a background color
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Center(
                  child: Text(
                    'Mbooke',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              navigationController.screenNumber = 0;
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Bookings",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              navigationController.screenNumber = 1;
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Services",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              navigationController.screenNumber = 2;
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Statistics",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              navigationController.screenNumber = 3;
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Store",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              navigationController.screenNumber = 4;
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Feedback",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              navigationController.screenNumber = 5;
              Navigator.pop(context);
            },
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              navigationController.screenNumber = 6;
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
