import 'package:equatable/equatable.dart';

import '../user.dart';

abstract class UserBlocState extends Equatable {
  final User user;

  const UserBlocState(this.user);

  const factory UserBlocState.init(User user) = InitState;

  const factory UserBlocState.successGetUser(User user) = SuccessGetUserState;

  const factory UserBlocState.successSaveUser(User user) = SuccessSaveUserState;

  @override
  List<Object?> get props => [user];
}

class InitState extends UserBlocState {
  const InitState(User user) : super(user);
}

class LoadingGetUserState extends UserBlocState {
  const LoadingGetUserState(User user) : super(user);
}

class SuccessGetUserState extends UserBlocState {
  const SuccessGetUserState(User user) : super(user);
}

class SuccessSaveUserState extends UserBlocState {
  const SuccessSaveUserState(User user) : super(user);
}
