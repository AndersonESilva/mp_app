import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedInFacebook extends AuthenticationEvent {}

class LoggedInGoogle extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}