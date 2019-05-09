import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracking_delivery_demo/blocs/bloc_provider.dart';
import 'package:tracking_delivery_demo/blocs/login_bloc.dart';
import 'package:tracking_delivery_demo/blocs/root_bloc.dart';
import 'package:tracking_delivery_demo/screens/home/index.dart';
import 'package:tracking_delivery_demo/screens/login/index.dart';

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  RootBloc _rootBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _rootBloc = BlocProvider.of<RootBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _rootBloc.firebaseUser,
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
        return !snapshot.hasData ?
            BlocProvider(
              bloc: LoginBloc(),
              child: LoginPage(),
            ) : HomePage(snapshot.data);
      },
    );
  }

}