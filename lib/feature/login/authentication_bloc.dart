
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/data/authentication_event.dart';
import 'package:mp_app/data/authentication_state.dart';
import 'package:mp_app/service/authentication_repository.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final _auth = AuthenticationRepository();

  @override
  get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(event) async*{
    if(event is AppStarted){
        yield* _mapAppStartedToState();
    } else if (event is LoggedInFacebook){

    } else if (event is LoggedInGoogle){

    } else if (event is LoggedOut){

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
}