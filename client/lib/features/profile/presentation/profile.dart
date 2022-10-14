import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/dimensions.dart';

import '../../../core/presentation/cubit/cubit.dart';
import '../../../core/presentation/widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Text('Profile Screen'),
        BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            return SizedBox(
              height: deviceHeight * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Logged In'),
                  ElevatedButton(
                      style: buttonStyle(),
                      onPressed: () =>
                          context.read<AuthenticationCubit>().logout(context),
                      child: const Text('Logout')),
                ],
              ),
            );
          },
        ),
      ],
    ));
  }
}
