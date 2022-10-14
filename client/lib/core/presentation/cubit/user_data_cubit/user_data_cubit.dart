import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/data/datasource/user_datasource.dart';
import 'package:music_player/core/data/model/user_data_model.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit()
      : super(UserDataLoading(
            user: User(name: '', email: '', playlists: []), isLoggedIn: false));

  late final UserDataSource userDataSource = UserDataSourceImpl();

  void getUserData(BuildContext context, String accessToken) async {
    try {
      emit(UserDataLoading(
          user: User(name: '', email: '', playlists: []), isLoggedIn: false));
      final userData = await userDataSource.getUserData(context, accessToken);
      emit(UserDataLoaded(userData: User.fromJson(userData)));
    } catch (e) {
      emit(UserDataError(
          user: User(name: '', email: '', playlists: []),
          error: e.toString(),
          isLoggedIn: false));
    }
  }

  void clearUserData() {
    emit(UserDataLoading(
        user: User(name: '', email: '', playlists: []), isLoggedIn: false));
  }

  User get userData => state.user;
}
