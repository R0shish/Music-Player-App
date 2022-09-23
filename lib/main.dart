import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/color_constant.dart';
import 'constants/text_theme.dart';
import 'features/navigation_bar/presentation/cubit/navbar_cubit.dart';
import 'features/navigation_bar/presentation/pages/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: AppColor.primary,
          secondaryHeaderColor: AppColor.secondary,
          scaffoldBackgroundColor: AppColor.black,
          textTheme: textTheme(),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.black,
            foregroundColor: AppColor.secondary,
          )),
      home: BlocProvider<NavbarCubit>(
        create: (_) => NavbarCubit(),
        child: const NavigationPage(),
      ),
    );
  }
}
