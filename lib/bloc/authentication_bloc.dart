import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/data/model/user.dart';
import 'package:mp_app/di/event/authentication_event.dart';
import 'package:mp_app/di/state/authentication_state.dart';
import 'package:mp_app/repository/user_repository.dart';

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
        try{
          final userAuth = await _auth.authentication(user);
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

  Stream<AuthenticationState> _mapLoggedInFacebookToState() async* {
    try{
      final _user = await _auth.signWithFacebook();
      yield Authenticated(_user);
    }catch(Error){
      yield AuthenticationError(Error.toString());
    }
  }

  Stream<AuthenticationState> _mapLoggedInGoogleToState() async* {
    try{
      final _user = await _auth.signWithGoogle();
      yield Authenticated(_user);
    }catch(Error){
      yield AuthenticationError(Error.toString());
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _auth.signOut();
  }

}
