import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mp_app/feature/home/home_page.dart';
import 'di/event/authentication_event.dart';
import 'di/state/authentication_state.dart';
import 'bloc/authentication_bloc.dart';
import 'feature/login/login_screen.dart';
import 'feature/splash/splash_page.dart';
import 'bloc/bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc()
      ..add(AuthenticationStarted()),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FLUTTER",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        // ignore: missing_return
        builder: (context, state){
          if(state is AuthenticationInitial ){
            return SplashPage();
          }else if (state is Authenticated) {
            return HomePage(user: state.user);
          }else{
            return LoginScreen();
          }
        },
      )
    );
  }
}

