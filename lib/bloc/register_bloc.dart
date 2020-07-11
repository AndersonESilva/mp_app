import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mp_app/di/event/register_event.dart';
import 'package:mp_app/di/state/register_state.dart';
import 'package:mp_app/repository/user_repository.dart';
import 'package:mp_app/util/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _userRepository = UserRepository();

  @override
  RegisterState get initialState => RegisterState.initial();

  @override
  Stream<Transition<RegisterEvent, RegisterState>> transformEvents(
      Stream<RegisterEvent> events,
      TransitionFunction<RegisterEvent, RegisterState> transitionFn,
      ) {
    final nonDebounceStream = events.where((event) {
      return (event is! RegisterEmailChanged && event is! RegisterPasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is RegisterEmailChanged || event is RegisterPasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {

    if (event is RegisterEmailChanged) {
      yield* _mapRegisterEmailChangedToState(event.email);

    } else if (event is RegisterPasswordChanged) {
      yield* _mapRegisterPasswordChangedToState(event.password);

    } else if (event is RegisterCheckEmail) {
      yield* _mapRegisterCheckEmailToState(event.email);

    }  else if (event is RegisterSubmitted) {
      yield* _mapRegisterSubmittedToState(event.email, event.password);
    }
  }

  Stream<RegisterState> _mapRegisterEmailChangedToState(String email) async*{
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapRegisterPasswordChangedToState(String password) async*{
    yield state.update(isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<RegisterState> _mapRegisterCheckEmailToState(String email) async*{
    yield RegisterState.loading();
    final _user = await _userRepository.getUserEmail(email);
    if(_user == null){
      yield RegisterState.navPassword();
    }else{
      yield RegisterState.failure();
    }
  }

  Stream<RegisterState> _mapRegisterSubmittedToState(String email,String password) async*{
    yield RegisterState.loading();
    try {
//      await _userRepository.signUp(
////        email: email,
////        password: password,
////      );
      yield RegisterState.success();
    } catch (_) {
      yield RegisterState.failure();
    }
  }
}
