import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/services/api_handler.dart';
import '../../../constants/constants.dart';

abstract class UserDataSource {
  Future<Map<String, dynamic>> getUserData(BuildContext context,
      {required Box userDataBox});
}

class UserDataSourceImpl implements UserDataSource {
  UserDataSourceImpl();

  @override
  Future<Map<String, dynamic>> getUserData(BuildContext context,
      {required Box userDataBox}) async {
    final response = await apiHandler(Api.userData, 'GET',
        authorization: true, userDataBox: userDataBox);
    return response;
  }
}
