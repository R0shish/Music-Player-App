import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player/constants/constants.dart';
import 'package:music_player/core/presentation/widgets/widgets.dart';

import '../../../core/presentation/cubit/cubit.dart';

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
          return SizedBox(
            height: deviceHeight * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lottie/searching.json',
                    fit: BoxFit.fitWidth),
                Text(
                  'Please Wait While We\nLoad Your Profile',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        } else if (state is UserDataLoaded) {
          return SizedBox(
            height: deviceHeight * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: deviceHeight * 0.04, top: deviceHeight * 0.02),
                  child: const Center(child: TextTitle(text: 'Profile')),
                ),
                Center(
                    child: CircleAvatar(
                  radius: deviceHeight * 0.07,
                  backgroundImage: CachedNetworkImageProvider(state
                          .user.avatar ??
                      'https://sites.cns.utexas.edu/sites/default/files/geometry_lab/files/default_person.jpg?m=1654796730'),
                )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.02),
                  child: Center(child: TextTitle(text: state.userData.name)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.02),
                  child: Center(child: TextTitle(text: state.userData.email)),
                ),
                Divider(
                  color: AppColor.secondary,
                  endIndent: deviceWidth * 0.05,
                  indent: deviceWidth * 0.05,
                ),
                SizedBox(height: deviceHeight * 0.01),
                Row(
                  children: [
                    Expanded(
                      child: TitleStyleText(
                        text1: '${state.userData.playlists.length}',
                        text2: '\nPlaylists',
                        textAlign: TextAlign.center,
                        fontSize: 20,
                      ),
                    ),
                    const Expanded(
                      child: TitleStyleText(
                        text1: '0\n',
                        text2: 'Followers',
                        textAlign: TextAlign.center,
                        fontSize: 20,
                      ),
                    ),
                    const Expanded(
                      child: TitleStyleText(
                        text1: '0\n',
                        text2: 'Following',
                        textAlign: TextAlign.center,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: deviceHeight * 0.04),
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: ((context, index) => Center(
                                child: ListTile(
                                  onTap: setting[index]['onTap'],
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: deviceWidth * 0.06),
                                  leading: Icon(
                                    setting[index]['icon'],
                                    color: AppColor.secondary,
                                  ),
                                  title:
                                      TextTitle(text: setting[index]['title']),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColor.secondary,
                                  ),
                                ),
                              )))),
                ),
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
