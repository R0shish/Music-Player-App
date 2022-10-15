import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/constants.dart';

import '../../../../core/presentation/cubit/cubit.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoading) {
          return const LoadingWidget();
        } else if (state is UserDataLoaded) {
          return SizedBox(
            height: deviceHeight * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopWidget(state: state),
                Divider(
                  color: AppColor.secondary,
                  endIndent: deviceWidth * 0.05,
                  indent: deviceWidth * 0.05,
                ),
                SizedBox(height: deviceHeight * 0.01),
                UserInfoRow(state: state),
                SizedBox(height: deviceHeight * 0.04),
                SettingsContainer(setting: setting),
              ],
            ),
          );
        } else if (state is UserDataError) {
          return Center(child: Text(state.error.toString()));
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      },
    );
  }
}
