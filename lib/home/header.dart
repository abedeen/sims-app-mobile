import 'package:admin/home/cubit/menu_app_cubit.dart';
import 'package:admin/home/search_field.dart';
import 'package:admin/home/widgets/profile_card.dart';
import 'package:admin/common/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuAppCubit>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text("Dashboard", style: Theme.of(context).textTheme.titleLarge),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(child: SearchField()),
        ProfileCard(),
      ],
    );
  }
}
