import 'package:dashboard/bloc/profile/profile_event.dart';
import 'package:dashboard/bloc/side_menu/side_menu_button_bloc.dart';
import 'package:dashboard/bloc/side_menu/side_menu_button_event.dart';
import 'package:dashboard/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard/bloc/profile/profile_bloc.dart';
import 'package:dashboard/bloc/profile/profile_state.dart';
import 'package:dashboard/bloc/header_title/header_title_bloc.dart';
import 'package:dashboard/bloc/header_title/header_title_state.dart';
import 'package:dashboard/theme/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                SizedBox(width: 10),
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                IconButton(
                  icon: Icon(Icons.menu, color: textColor),
                  onPressed: () {
                    context.read<SideMenuBloc>().add(ToggleSideMenuEvent());
                  },
                ),
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                SizedBox(width: 10),
              if (!Responsive.isMobile(context)) ...[
                SizedBox(width: 20),
                BlocBuilder<HeaderTitleBloc, HeaderTitleState>(
                  builder: (context, state) {
                    String title = 'Dashboard';
                    if (state is HeaderTitleUpdated) {
                      title = state.title;
                    }
                    return Text(
                      title,
                      style: TextStyle(
                        fontSize: Responsive.isMobile(context) ? 28 : 38,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    );
                  },
                ),
              ],
              Spacer(),
              SizedBox(
                width:
                    Responsive.isMobile(context) || Responsive.isTablet(context)
                        ? constraints.maxWidth * 0.3
                        : constraints.maxWidth * 0.4,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    fillColor: textColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(16.0 * 0.75),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                    ),
                  ),
                  onChanged: (text) {
                    final sanitizedText = text.replaceAll(RegExp(r'[^\w\s]+'), '');
                  },
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                onTap: () {
                  _showAccountList(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: accentColor2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      if (!Responsive.isMobile(context) &&
                          !Responsive.isTablet(context))
                        SizedBox(width: 10),
                      if (!Responsive.isMobile(context) &&
                          !Responsive.isTablet(context))
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            if (state.isLoading) {
                              return CircularProgressIndicator();
                            } else if (state.hasError) {
                              return Text(
                                'Error loading profile',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: accentColor2,
                                ),
                              );
                            } else {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: accentColor2,
                                    ),
                                  ),
                                  Text(
                                    state.email,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: accentColor2,
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
            ],
          );
        },
      ),
    );
  }

  void _showAccountList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state.hasError) {
              return Center(child: Text('Ada apa ini awkwkwkwk'));
            } else {
              return ListView.builder(
                itemCount: state.accounts.length,
                itemBuilder: (context, index) {
                  final account = state.accounts[index];
                  return ListTile(
                    title: Text(account.name),
                    subtitle: Text(account.email),
                    onTap: () {
                      Navigator.pop(context);
                      context.read<ProfileBloc>().add(
                            ChangeProfile(
                              name: account.name,
                              email: account.email,
                              permissions: account.permissions,
                            ),
                          );
                    },
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
