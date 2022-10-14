import 'package:flutter/material.dart';
import 'package:music_player/services/api_handler.dart';
import '../../../constants/constants.dart';

abstract class UserDataSource {
  Future<Map<String, dynamic>> getUserData(
      BuildContext context, String accessToken);
}

class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl();

  @override
  Future<Map<String, dynamic>> getUserData(
      BuildContext context, String accessToken) async {
    final response = await apiHandler(Api.userData, 'GET',
        authorization: true, token: accessToken);
    return response;
  }
}
