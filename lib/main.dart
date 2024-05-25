import 'package:dashboard/bloc/navigation/navigation_bloc.dart';
import 'package:dashboard/helpers/page_routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme/color.dart';

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
      child: MaterialApp(
        title: 'Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: background,
          useMaterial3: true,
        ),
        onGenerateRoute: Application.router.generator,
        initialRoute: Routes.home,
      ),
    );
  }
}
