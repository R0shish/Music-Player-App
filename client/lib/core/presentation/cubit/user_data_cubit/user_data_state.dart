part of 'user_data_cubit.dart';

@immutable
abstract class UserDataState extends Equatable {
  final User user;
  final bool isLoggedIn;
  const UserDataState({required this.user, required this.isLoggedIn});

  @override
  List<Object> get props => [user];
}

class UserDataLoading extends UserDataState {
  const UserDataLoading({required super.user, required super.isLoggedIn});

  @override
  List<Object> get props => [user];
}

class UserDataLoaded extends UserDataState {
  final User userData;
  const UserDataLoaded({required this.userData})
      : super(user: userData, isLoggedIn: true);

  @override
  List<Object> get props => [user];
}

class UserDataError extends UserDataState {
  final String error;
  const UserDataError(
      {required super.user, required this.error, required super.isLoggedIn});

  @override
  List<Object> get props => [user, error];
}
