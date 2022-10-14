import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/presentation/cubit/cubit.dart';
import 'package:music_player/services/api_handler.dart';
import '../../../constants/constants.dart';

abstract class UserDataSource {
  Future<Map<String, dynamic>> getUserData(BuildContext context);
}

class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl();

  @override
  Future<Map<String, dynamic>> getUserData(BuildContext context) async {
    final response = await apiHandler(Api.userData, 'GET',
        authorization: true,
        token: context
            .read<AuthenticationCubit>()
            .userDataBox
            .get('access_token'));
    return response;
  }
}
