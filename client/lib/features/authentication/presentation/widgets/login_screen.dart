import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../../constants/constants.dart';

import '../../../../core/presentation/cubit/cubit.dart';
import '../../../../core/presentation/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: deviceHeight * 0.04),
        Image.asset('assets/images/unboxing.png'),
        SizedBox(height: deviceHeight * 0.05),
        const Text('Login',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        BlocBuilder<AuthenticationCubit, AuthenticationState>(
          builder: (context, state) {
            return state.isLoading
                ? Column(
                    children: [
                      Lottie.asset('assets/lottie/paperplane_loading.json',
                          fit: BoxFit.fill),
                      Text(
                        'Please Wait While We\nCheck Your Credentials',
                        style: Theme.of(context).textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      // Precaching loading animation
                      Lottie.asset('assets/lottie/paperplane_loading.json',
                          width: 0, height: 0),
                      SizedBox(height: deviceHeight * 0.02),
                      CustomTextFormField(
                          controller: _emailController,
                          hintText: 'Enter your email ID',
                          iconData: Icons.alternate_email_outlined,
                          labelText: 'Email ID'),
                      SizedBox(height: deviceHeight * 0.02),
                      CustomTextFormField(
                          controller: _passwordController,
                          hintText: 'Enter your password',
                          iconData: Icons.lock_outline,
                          labelText: 'Password',
                          isPassword: true),
                      SizedBox(height: deviceHeight * 0.01),
                      Container(
                        alignment: Alignment.centerRight,
                        width: deviceWidth,
                        child: TextButton(
                            onPressed: () {},
                            child: Text('Forgot Password?',
                                style: Theme.of(context).textTheme.headline4)),
                      ),
                      SizedBox(height: deviceHeight * 0.01),
                      ElevatedButton(
                        style: buttonStyle(),
                        onPressed: () => context
                            .read<AuthenticationCubit>()
                            .login(
                                context: context,
                                email: _emailController.text.toLowerCase(),
                                password: _passwordController.text),
                        child: Text('Login',
                            style: Theme.of(context).textTheme.headline2),
                      ),
                      SizedBox(height: deviceHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () => context
                                .read<AuthenticationCubit>()
                                .goToRegisterScreen(),
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  color: AppColor.primary, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
