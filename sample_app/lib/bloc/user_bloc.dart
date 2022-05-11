import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/bloc/user_bloc_event.dart';
import 'package:sample_app/bloc/user_bloc_state.dart';
import 'package:sample_app/user_repository.dart';

import '../user.dart';

class UserBloc extends Bloc<UserBlocEvent, UserBlocState> {
  final UserRepository userRepository;

  UserBloc({
    required this.userRepository,
  }) : super(const UserBlocState.init(User.empty())) {
    on<GetUserEvent>(_onGetUserEvent);
    on<SaveUserEvent>(_onSaveUserEvent);
  }

  void _onGetUserEvent(GetUserEvent event, emit) {
    final user = userRepository.getUser();
    emit(UserBlocState.successGetUser(user));
  }

  void _onSaveUserEvent(SaveUserEvent event, emit) {
    userRepository.saveUser(event.user);
    emit(UserBlocState.successSaveUser(event.user));
  }
}
