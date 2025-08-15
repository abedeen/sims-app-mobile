import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'menu_appcubit_state.dart';

class MenuAppCubit extends Cubit<MenuAppState> {
  MenuAppCubit() : super(MenuAppInitial());

  // TODO Remove this to a navigation service
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
