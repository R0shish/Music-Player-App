import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/authentication/presentation/pages/authentication.dart';
import '../../../../constants/constants.dart';

import '../../../../core/presentation/cubit/cubit.dart';
import '../../../../core/presentation/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: deviceHeight * 0.02),
        Image.asset('assets/images/unboxing.png'),
        const Text('Login',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        SizedBox(height: deviceHeight * 0.02),
        const CustomTextFormField(
          hintText: 'Enter your email ID',
          iconData: Icons.alternate_email_outlined,
          labelText: 'Email ID',
        ),
        SizedBox(height: deviceHeight * 0.02),
        const CustomTextFormField(
          hintText: 'Enter your password',
          iconData: Icons.lock,
          labelText: 'Password',
          obscureText: true,
        ),
        SizedBox(height: deviceHeight * 0.01),
        Container(
          alignment: Alignment.centerRight,
          width: deviceWidth,
          child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: Theme.of(context).textTheme.headline4,
              )),
        ),
        SizedBox(height: deviceHeight * 0.01),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(deviceWidth * 0.9, deviceHeight * 0.06),
            backgroundColor: AppColor.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Login',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(height: deviceHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Don\'t have an account?'),
            TextButton(
              onPressed: () =>
                  context.read<AuthenticationCubit>().goToRegisterScreen(),
              child: const Text(
                'Register',
                style: TextStyle(color: AppColor.primary, fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
