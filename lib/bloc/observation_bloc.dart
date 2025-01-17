import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/di/event/observation_event.dart';
import 'package:mp_app/di/state/observation_state.dart';
import 'package:mp_app/repository/user_repository.dart';

class ObservationBloc extends Bloc<ObservationEvent, ObservationState> {
  final UserRepository _userRepository = UserRepository();
  final String idUser;

  ObservationBloc(this.idUser);

  @override
  get initialState => Uninitialized();

  @override
  Stream<ObservationState> mapEventToState(event) async*{
    if(state is Uninitialized){
      if(event is ObservationInit){
        if(event.observation){
          yield Observing();
          return;
        }else{
          yield UnObserving();
          return;
        }
      }
    }else{
      if(event is ObservationChange){
        if(state is Observing){
          await _userRepository.unobserving(idUser, event.idEvent);
          yield UnObserving();
          return;
        }
        if(state is UnObserving){
          await _userRepository.observe(idUser, event.idEvent);
          yield Observing();
          return;
        }
      }
    }
  }
}
