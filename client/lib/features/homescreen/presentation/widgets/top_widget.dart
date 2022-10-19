import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/presentation/cubit/cubit.dart';

import '../../../../constants/constants.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: deviceHeight * 0.05,
          left: deviceWidth * 0.03,
          right: deviceWidth * 0.03),
      height: deviceHeight / 10,
      width: deviceWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.grey),
      ),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<UserDataCubit, UserDataState>(
            builder: (context, state) {
              return CircleAvatar(
                radius: deviceWidth * 0.05,
                foregroundImage: CachedNetworkImageProvider(
                  state.user.avatar ??
                      'https://sites.cns.utexas.edu/sites/default/files/geometry_lab/files/default_person.jpg?m=1654796730',
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: deviceWidth * 0.01),
              Text(
                'Good Morning,',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              BlocBuilder<UserDataCubit, UserDataState>(
                builder: (context, state) {
                  if (!state.isLoggedIn) {
                    return Text(
                      'Guest User',
                      style: Theme.of(context).textTheme.headline2,
                    );
                  } else if (state is UserDataLoading) {
                    return Text(
                      'Loading...',
                      style: Theme.of(context).textTheme.headline2,
                    );
                  }
                  return Text(
                    state.user.name,
                    style: Theme.of(context).textTheme.headline2,
                  );
                },
              ),
              SizedBox(height: deviceWidth * 0.01),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: deviceWidth * 0.13,
            height: deviceHeight * 0.06,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.grey),
            ),
            child: Icon(
              Icons.notifications_outlined,
              color: AppColor.secondary,
              size: deviceWidth * 0.056,
            ),
          ),
        ),
      ]),
    );
  }
}
