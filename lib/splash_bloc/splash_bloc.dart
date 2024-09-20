import 'dart:async';

import 'package:bloc_sample_application/splash_bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'splash_events.dart';

class SplashBloc extends Bloc<SplashEvent,SplashState>{
  SplashBloc() : super( SplashInitialState() ){
    
    Timer(const Duration(seconds: 4), () {
      add(SplashLoadedEvent());
    });
    on<SplashLoadedEvent>((event, emit) => emit(SplashLoadedLoginState()));
  }
}