import 'package:equatable/equatable.dart';
import 'package:sample_app/user.dart';

abstract class UserBlocEvent extends Equatable {
  const UserBlocEvent();

  factory UserBlocEvent.getUser() = GetUserEvent;

  const factory UserBlocEvent.saveUser(User user) = SaveUserEvent;
}

class GetUserEvent extends UserBlocEvent {
  @override
  List<Object?> get props => [];
}

class SaveUserEvent extends UserBlocEvent {
  final User user;

  const SaveUserEvent(this.user);

  @override
  List<Object?> get props => [user];
}
