import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mp_app/data/model/user.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent{
  final User user;

  const AuthenticationLoggedIn( {@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Authenticated { user: $user }';
}

class AuthenticationLoggedOut extends AuthenticationEvent {}
