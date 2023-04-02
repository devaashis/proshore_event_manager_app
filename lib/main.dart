import 'package:flutter/material.dart';
import 'package:proshore_even_manager_app/util/app_providers.dart';
import 'package:proshore_even_manager_app/util/app_router.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MultiProvider(
    providers: appProviders,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: "Proshore EventManager",
          routerConfig: AppRouter().router,
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
          ),
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
