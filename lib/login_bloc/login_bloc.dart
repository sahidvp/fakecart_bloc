import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/api_functions.dart';
import 'login_events.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc() : super(LoginInitialState()){
    
    on<LoginButtonClickEvent>((event, emit)async{
      emit(LoginLoadingState());
      final response = await login(event.userName, event.password);
      if(response.statusCode == 401){
        emit(LoginFailedState(response.body));
      }else if(response.statusCode == 200){
        emit(LoginSuccessState());
      }
    });
  }
}