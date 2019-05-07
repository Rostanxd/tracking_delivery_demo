import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracking_delivery_demo/blocs/bloc_provider.dart';
import 'package:tracking_delivery_demo/blocs/login_bloc.dart';
import 'package:tracking_delivery_demo/blocs/root_bloc.dart';
import 'package:tracking_delivery_demo/screens/home/index.dart';
import 'package:tracking_delivery_demo/screens/login/index.dart';

class RootPage extends StatefulWidget {
  final RootBloc _rootBloc;

  RootPage(this._rootBloc);

  @override
  State<StatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  LoginBloc _loginBloc = LoginBloc();


  @override
  void initState() {
    widget._rootBloc.userLogged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget._rootBloc.firebaseUser,
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
        return !snapshot.hasData ?
            BlocProvider(
              bloc: _loginBloc,
              child: LoginPage(_loginBloc),
            ) : HomePage(snapshot.data);
      },
    );
  }

}