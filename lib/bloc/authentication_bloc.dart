import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/data/model/user.dart';
import 'package:mp_app/di/event/authentication_event.dart';
import 'package:mp_app/di/state/authentication_state.dart';
import 'package:mp_app/repository/user_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final _userRepository = UserRepository();

  @override
  get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(event) async*{
    if(event is AuthenticationStarted){
      yield* _mapAppStartedToState();
    } else if (event is AuthenticationLoggedIn){
      yield* _mapLoggedIn(event.user);
    } else if (event is AuthenticationLoggedOut){
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    final userFire = await _userRepository.getCurrentUser();

    if (userFire != null) {
      var _userId = userFire?.uid;

      if(_userId.length > 0 && _userId != null){
        try{
          final user = User("", userFire.displayName, userFire.email, userFire.photoUrl, userFire.uid, "", "");
          final userAuth = await _userRepository.getUserEmail(user.email);
          yield Authenticated(userAuth);
        }catch(Error){
          yield AuthenticationError(Error.toString());
        }
      }else{
        yield Unauthenticated();
      }

    }else{
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedIn(User user) async* {
    try{
      final _user = await _userRepository.getUserEmail(user.email);
      yield Authenticated(_user);
    }catch(Error){
      yield AuthenticationError(Error.toString());
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }

}
