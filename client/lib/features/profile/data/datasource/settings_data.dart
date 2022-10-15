import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/cubit/cubit.dart';

class SettingsData {
  static List<Map<String, dynamic>> settingData(BuildContext context) {
    final List<Map<String, dynamic>> setting = [
      {
        "title": 'Settings',
        "icon": Icons.settings,
        "onTap": () => debugPrint('TO:DO Settings'),
      },
      {
        "title": 'Billing Details',
        "icon": Icons.credit_card,
        "onTap": () => debugPrint('TO:DO Billing Details'),
      },
      {
        "title": 'User Management',
        "icon": Icons.person,
        "onTap": () => debugPrint('TO:DO User Management'),
      },
      {
        "title": 'Information',
        "icon": Icons.info,
        "onTap": () => debugPrint('TO:DO Information'),
      },
      {
        "title": 'Log out',
        "icon": Icons.logout,
        "onTap": () => context.read<AuthenticationCubit>().logout(context)
      },
    ];

    return setting;
  }
}
