import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/presentation/cubit/cubit.dart';
import '../../../../constants/constants.dart';

import '../../../../core/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: deviceHeight * 0.02),
              Image.asset('assets/images/unboxing.png'),
              const Text('Register',
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
              const CustomTextFormField(
                hintText: 'Confirm your password',
                iconData: Icons.lock,
                labelText: 'Confirm Password',
                obscureText: true,
              ),
              SizedBox(height: deviceHeight * 0.02),
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
                  'Register',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              SizedBox(height: deviceHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: AppColor.primary, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
