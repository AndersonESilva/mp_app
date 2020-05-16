import 'package:equatable/equatable.dart';

enum AuthEvent {
  FACEBOOK,
  GOOGLE
}

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedInFacebook extends AuthenticationEvent {}

class LoggedInGoogle extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}