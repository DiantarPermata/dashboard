import 'package:dashboard/bloc/side_menu/side_menu_button_bloc.dart';
import 'package:dashboard/bloc/side_menu/side_menu_button_state.dart';
import 'package:dashboard/pages/profile/widget/profile_widget.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:dashboard/widgets/side_menu_widget.dart';
import 'package:dashboard/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: !Responsive.isDesktop(context)
          ? Drawer(
              backgroundColor:
                  backgroundSecondaryColor, // Ubah warna background drawer
              child: SideMenuWidget(),
            )
          : null,
      body: BlocListener<SideMenuBloc, SideMenuState>(
        listener: (context, state) {
          if (state is SideMenuOpened) {
            _scaffoldKey.currentState?.openDrawer();
          } else if (state is SideMenuClosed) {
            _scaffoldKey.currentState?.closeDrawer();
          }
        },
        child: SafeArea(
          child: Row(
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blueGrey, // Ubah warna background drawer
                    child: SideMenuWidget(),
                  ),
                ),
              Expanded(flex: 7, child: ProfileWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
