import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/cubit/cubit.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Scaffold(
            body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            return SingleChildScrollView(child: state.currentScreen);
          },
        )),
      ),
    );
  }
}
