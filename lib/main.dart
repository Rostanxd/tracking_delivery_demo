import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracking_delivery_demo/blocs/bloc_provider.dart';
import 'package:tracking_delivery_demo/blocs/root_bloc.dart';
import 'package:tracking_delivery_demo/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RootBloc _rootBloc = RootBloc();

    /// To set-up vertical orientation (portrait).
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
        debugShowCheckedModeBanner: true,
        routes: <String, WidgetBuilder>{},
        home: BlocProvider<RootBloc>(
          bloc: _rootBloc,
          child: RootPage(_rootBloc),
        )
    );
  }
}
