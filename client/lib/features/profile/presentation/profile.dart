import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/dimensions.dart';

import '../../../core/presentation/cubit/cubit.dart';
import '../../../core/presentation/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = UserDataCubit();
        cubit.getUserData(context);
        return cubit;
      },
      child: Center(
          child: Column(
        children: [
          const Text('Profile Screen'),
          SizedBox(
            height: deviceHeight * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocBuilder<UserDataCubit, UserDataState>(
                  builder: (context, state) {
                    if (state is UserDataLoaded) {
                      return Column(
                        children: [
                          Text(state.userData.name),
                          Text(state.userData.email),
                        ],
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () =>
                        context.read<AuthenticationCubit>().logout(context),
                    child: const Text('Logout')),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
