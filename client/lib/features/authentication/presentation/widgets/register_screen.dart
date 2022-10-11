import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/constants.dart';

import '../../../../core/presentation/cubit/cubit.dart';
import '../../../../core/presentation/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmationPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: deviceHeight * 0.02),
        Center(
            child: Image.asset('assets/images/unboxing.png',
                height: deviceHeight * 0.2)),
        const Text('Register',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        SizedBox(height: deviceHeight * 0.02),
        CustomTextFormField(
          controller: _nameController,
          hintText: 'Enter your name',
          iconData: Icons.person,
          labelText: 'Name',
        ),
        SizedBox(height: deviceHeight * 0.02),
        CustomTextFormField(
          controller: _emailController,
          hintText: 'Enter your email ID',
          iconData: Icons.alternate_email_outlined,
          labelText: 'Email ID',
        ),
        SizedBox(height: deviceHeight * 0.02),
        CustomTextFormField(
          controller: _passwordController,
          hintText: 'Enter your password',
          iconData: Icons.lock_outline,
          labelText: 'Password',
          isPassword: true,
        ),
        SizedBox(height: deviceHeight * 0.01),
        CustomTextFormField(
          controller: _confirmationPasswordController,
          hintText: 'Confirm your password',
          iconData: Icons.check,
          labelText: 'Confirm Password',
          isPassword: true,
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
          onPressed: () => context.read<AuthenticationCubit>().register(
              context: context,
              name: _nameController.text,
              email: _emailController.text.toLowerCase(),
              password: _passwordController.text,
              confirmPassword: _confirmationPasswordController.text),
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
              onPressed: () =>
                  context.read<AuthenticationCubit>().goToLoginScreen(),
              child: const Text(
                'Login',
                style: TextStyle(color: AppColor.primary, fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmationPasswordController.dispose();
    super.dispose();
  }
}
