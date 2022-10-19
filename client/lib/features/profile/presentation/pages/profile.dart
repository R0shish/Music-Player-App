import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/constants.dart';

import '../../../../core/presentation/cubit/cubit.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoading) {
          return const LoadingWidget();
        } else if (state is UserDataLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopWidget(state: state),
              const _PageDivider(),
              UserInfoRow(state: state),
              const _PageDivider(),
              Padding(
                padding: EdgeInsets.all(deviceWidth * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    LastPlayedRow(),
                    _PageDivider(),
                    PlaylistGrid(),
                  ],
                ),
              )
            ],
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

class _PageDivider extends StatelessWidget {
  const _PageDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColor.secondary,
      thickness: 0.1,
      endIndent: deviceWidth * 0.01,
      indent: deviceWidth * 0.01,
      height: MediaQuery.of(context).size.height * 0.04,
    );
  }
}
