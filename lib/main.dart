import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracking_delivery_demo/blocs/bloc_provider.dart';
import 'package:tracking_delivery_demo/blocs/login_bloc.dart';
import 'package:tracking_delivery_demo/screens/login/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc _loginBloc = LoginBloc();

    /// To set-up vertical orientation (portrait).
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        debugShowCheckedModeBanner: true,
        routes: <String, WidgetBuilder>{},
        home: BlocProvider<LoginBloc>(
          bloc: _loginBloc,
          child: LoginPage(_loginBloc),
        )
    );
  }
}
