import 'package:bloc/bloc.dart';
import 'package:bloc_educational/Features/Users/Bloc/users_events.dart';
import 'package:bloc_educational/Features/Users/Bloc/users_states.dart';

class UserBloc extends Bloc<UserEvents,UserState>{
  UserBloc():super(UserState([])){
    on<AddUser>((event,emit){
      state.users.add('${event.name} - ${DateTime.now().second}');
      return emit(UserState(state.users));
    });
    on<ClearUsers>((event,emit){
      state.users.clear();
      return emit(UserState(state.users));
    });
    on<RemoveUser>((event,emit){
      state.users.removeAt(event.index);
      return emit(UserState(state.users));
    });
  }
}