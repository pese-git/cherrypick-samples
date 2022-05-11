import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String email;

  const User({required this.name, required this.email});

  const User.empty()
      : name = '',
        email = '';

  @override
  List<Object?> get props => [name, email];

  @override
  bool? get stringify => true;
}
