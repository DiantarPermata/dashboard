import 'package:dashboard/bloc/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'helpers/page_routing/routes.dart';
import 'helpers/page_routing/application.dart';
import 'bloc/profile/profile_bloc.dart';
import 'bloc/profile/profile_event.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: BlocProvider(
        create: (context) => ProfileBloc()..add(FetchProfile()),
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
      ),
    );
  }
}
