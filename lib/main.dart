import 'package:d2y_flutter_bloc/core/common/themes.dart';
import 'package:d2y_flutter_bloc/core/router/go_router_init.dart';
import 'package:d2y_flutter_bloc/presentation/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './injection.dart' as di;

void main() {
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => di.locator<ThemeBloc>())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'D2Y Flutter Boilerplate',
        theme: themeLight(context),
        darkTheme: themeDark(context),
        themeMode: ThemeMode.system,
        routerConfig: routerinit,
      ),
    );
  }
}
