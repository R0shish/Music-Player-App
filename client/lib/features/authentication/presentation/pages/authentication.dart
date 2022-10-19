import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/constants.dart';
import '../../../../core/presentation/cubit/cubit.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(
            top: deviceHeight * 0.04,
            left: deviceWidth * 0.05,
            right: deviceWidth * 0.05),
        child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            return SingleChildScrollView(child: state.currentScreen);
          },
        ),
      ),
    );
  }
}
