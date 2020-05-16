import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/di/event/authentication_event.dart';
import 'package:mp_app/di/state/authentication_state.dart';
import 'package:mp_app/repository/authentication_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final _auth = AuthenticationRepository();

  @override
  get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(event) async*{
    if(event is AppStarted){
        yield* _mapAppStartedToState();
    } else if (event is LoggedInFacebook){
        yield* _mapLoggedInFacebookToState();
    } else if (event is LoggedInGoogle){
      yield* _mapLoggedInGoogleToState();
    } else if (event is LoggedOut){
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    final user = await _auth.getCurrentUser();

    if (user != null) {
      var _userId = user?.uid;

      if(_userId.length > 0 && _userId != null){
        yield Authenticated(_userId);
      }else{
        yield Error(_userId);
      }

    }else{
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInFacebookToState() async* {
    final _userId = await _auth.signWithFacebook();

    if(_userId.length > 0 && _userId != null){
      yield Authenticated(_userId);
    }else{
      yield Error(_userId);
    }
  }

  Stream<AuthenticationState> _mapLoggedInGoogleToState() async* {
    final _userId = await _auth.signWithGoogle();

    if(_userId.length > 0 && _userId != null){
      yield Authenticated(_userId);
    }else{
      yield Error(_userId);
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _auth.signOut();
  }

}
