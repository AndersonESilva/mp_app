import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String userId;

  const Authenticated(this.userId);

  @override
  List<Object> get props => [userId];

  @override
  String toString() => 'Authenticated { userId: $userId }';
}

class Unauthenticated extends AuthenticationState {}

class Error extends AuthenticationState {

  final String messageError;

  const Error(this.messageError);

  @override
  List<Object> get props => [messageError];

  @override
  String toString() => 'Error { messageError: $messageError }';
}