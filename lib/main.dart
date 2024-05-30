import 'package:dashboard/bloc/side_menu/side_menu_button_bloc.dart';
import 'package:dashboard/data%20copy/services/service_profile.dart';
import 'package:dashboard/helpers/network/api_helper_dio.dart';
import 'package:dashboard/helpers/page_routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helpers/page_routing/application.dart';
import 'bloc/profile/profile_bloc.dart';
import 'bloc/profile/profile_event.dart';
import 'bloc/navigation/navigation_bloc.dart';
import 'bloc/header_title/header_title_bloc.dart';
import 'package:dashboard/helpers/network/api_helper.dart';
import 'package:dio/dio.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;

  final dio = Dio();
  final apiHelper = ApiHelperImpl(dio: dio);

  runApp(MyApp(apiHelper: apiHelper));
}

class MyApp extends StatelessWidget {
  final ApiHelper apiHelper;

  MyApp({required this.apiHelper});

  @override
  Widget build(BuildContext context) {
    final serviceProfile = ServiceProfile(apiHelper: apiHelper);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(serviceProfile: serviceProfile)..add(FetchProfile()),
        ),
        BlocProvider(
          create: (context) => HeaderTitleBloc(),
        ),
        BlocProvider(
          create: (context) => SideMenuBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          useMaterial3: true,
        ),
        onGenerateRoute: Application.router.generator,
        initialRoute: Routes.home,
      ),
    );
  }
}
