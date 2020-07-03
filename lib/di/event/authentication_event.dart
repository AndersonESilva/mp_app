import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mp_app/data/model/user.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedInFacebook extends AuthenticationEvent {}

class LoggedInGoogle extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent{
  final User user;

  const AuthenticationLoggedIn( {@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Authenticated { user: $user }';
}

class LoggedOut extends AuthenticationEvent {}