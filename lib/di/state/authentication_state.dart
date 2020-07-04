import 'package:equatable/equatable.dart';
import 'package:mp_app/data/model/user.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final User user;

  const Authenticated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Authenticated { user: $user }';
}

class Unauthenticated extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {

  final String messageError;

  const AuthenticationError(this.messageError);

  @override
  List<Object> get props => [messageError];

  @override
  String toString() => 'Error { messageError: $messageError }';
}
