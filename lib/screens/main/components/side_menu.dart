import 'package:admin/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class SideMenu extends StatelessWidget {
//   const SideMenu({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           DrawerHeader(
//             child: Image.asset("assets/images/logo.png"),
//           ),
//           DrawerListTile(
//             title: "Dashboard",
//             svgSrc: "assets/icons/menu_dashboard.svg",
//             press: () {},
//           ),
//           DrawerListTile(
//             title: "Active Listings",
//             svgSrc: "assets/icons/menu_tran.svg",
//             press: () {},
//           ),
//           DrawerListTile(
//             title: "Orders",
//             svgSrc: "assets/icons/menu_task.svg",
//             press: () {},
//           ),
//           DrawerListTile(
//             title: "Stocks",
//             svgSrc: "assets/icons/menu_doc.svg",
//             press: () {},
//           ),
//           DrawerListTile(
//             title: "Postage Labels",
//             svgSrc: "assets/icons/menu_store.svg",
//             press: () {},
//           ),
//           DrawerListTile(
//             title: "Purchase Orders",
//             svgSrc: "assets/icons/menu_notification.svg",
//             press: () {},
//           ),
//           DrawerListTile(
//             title: "Online Accounts",
//             svgSrc: "assets/icons/menu_profile.svg",
//             press: () {},
//           ),
//           DrawerListTile(
//             title: "Settings",
//             svgSrc: "assets/icons/menu_setting.svg",
//             press: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  List<dynamic> subMenus = [];

  @override
  void initState() {
    super.initState();
    loadSubMenus(); // ✅ called BEFORE build
  }

  Future<void> loadSubMenus() async {
    final apiService = ApiService();
    final list = await apiService.getData(
      'https://simsapp.co.uk/api/accounts?page=0&pageSize=100',
    );

    setState(() {
      subMenus = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),

          // Static menu
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {},
          ),
          // 🔥 PARENT MENU: Listings
          ExpansionTile(
            leading: const Icon(Icons.list, color: Colors.white54),
            title: const Text(
              "Listings",
              style: TextStyle(color: Colors.white54),
            ),
            children: subMenus.map((item) {
              final name = item['accountName']?.toString() ?? 'Unknown';

              return ListTile(
                contentPadding: const EdgeInsets.only(left: 60),
                title: Text(
                  name,
                  style: const TextStyle(color: Colors.white70),
                ),
                onTap: () {
                  debugPrint('Clicked $name');
                },
              );
            }).toList(),
          ),
          ExpansionTile(
            leading: const Icon(Icons.list, color: Colors.white54),
            title: const Text(
              "Orders",
              style: TextStyle(color: Colors.white54),
            ),
            children: subMenus.map((item) {
              final name = item['accountName']?.toString() ?? 'Unknown';

              return ListTile(
                contentPadding: const EdgeInsets.only(left: 60),
                title: Text(
                  name,
                  style: const TextStyle(color: Colors.white70),
                ),
                onTap: () {
                  debugPrint('Clicked $name');
                },
              );
            }).toList(),
          ),
          ExpansionTile(
            leading: const Icon(Icons.list, color: Colors.white54),
            title: const Text(
              "Postage Labels",
              style: TextStyle(color: Colors.white54),
            ),
            children: subMenus.map((item) {
              final name = item['accountName']?.toString() ?? 'Unknown';

              return ListTile(
                contentPadding: const EdgeInsets.only(left: 60),
                title: Text(
                  name,
                  style: const TextStyle(color: Colors.white70),
                ),
                onTap: () {
                  debugPrint('Clicked $name');
                },
              );
            }).toList(),
          ),

          /// 3️⃣ Orders
          DrawerListTile(
            title: "Orders",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {},
          ),

          /// 4️⃣ Stocks
          DrawerListTile(
            title: "Stocks",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {},
          ),

          /// 5️⃣ Postage Labels
          DrawerListTile(
            title: "Postage Labels",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {},
          ),

          /// 6️⃣ Online Accounts
          DrawerListTile(
            title: "Online Accounts",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
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
