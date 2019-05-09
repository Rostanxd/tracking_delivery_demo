import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracking_delivery_demo/blocs/bloc_provider.dart';
import 'package:tracking_delivery_demo/blocs/root_bloc.dart';
import 'package:tracking_delivery_demo/components/user_drawer.dart';
import 'package:tracking_delivery_demo/screens/home/dispatcher.dart';
import 'package:tracking_delivery_demo/screens/home/driver.dart';
import 'package:tracking_delivery_demo/screens/home/manager.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser _user;

  HomePage(this._user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RootBloc _rootBloc;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    _rootBloc = BlocProvider.of<RootBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(''),
      ),
      drawer: UserDrawer(_rootBloc),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .document(widget._user.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');

          return snapshot.hasData
              ? checkRole(snapshot.data)
              : CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _scaffoldKey.currentState
                .showSnackBar(SnackBar(content: Text('Genera novedad...')));
          }),
    );
  }

  Widget checkRole(DocumentSnapshot snapshot) {
    switch (snapshot.data['role']) {
      case '02':
        return DriverPage();
        break;
      case '03':
        return DispatcherPage();
        break;
      default:
        return ManagerPage();
    }
  }
}
