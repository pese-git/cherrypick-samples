import 'package:cherrypick/cherrypick.dart';
import 'package:sample_app/bloc/user_bloc.dart';
import 'package:sample_app/pref_user_repository.dart';
import 'package:sample_app/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryModule extends Module {
  final SharedPreferences sharedPreferences;

  RepositoryModule({required this.sharedPreferences});

  @override
  void builder(Scope currentScope) {
    bind<UserRepository>()
        .toProvide(
            () => PrefUserRepository(sharedPreferences: sharedPreferences))
        .singleton();

    bind<UserBloc>().toProvide(
      () => UserBloc(
        userRepository: currentScope.resolve<UserRepository>(),
      ),
    );
  }
}
