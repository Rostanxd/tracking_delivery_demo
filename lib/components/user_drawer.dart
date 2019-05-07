import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracking_delivery_demo/blocs/bloc_provider.dart';
import 'package:tracking_delivery_demo/blocs/root_bloc.dart';

class UserDrawer extends StatelessWidget {
  final FirebaseUser _user;
  RootBloc _rootBloc;

  UserDrawer(this._user);

  @override
  Widget build(BuildContext context) {
    _rootBloc = BlocProvider.of<RootBloc>(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          _header(),
          ListTile(
            onTap: (){
              FirebaseAuth.instance.signOut();
              _rootBloc.userLogged();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text('Salir'),
          )
        ],
      ),
    );
  }

  Widget _header() {
    return DrawerHeader(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
                height: 60.0,
                width: 60.0,
                margin: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/user_one.jpg')))),
            Container(
              child: StreamBuilder(
                stream: Firestore.instance
                    .collection('users')
                    .document(_user.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');

                  return Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: snapshot.hasData
                        ? Text(
                            '${snapshot.data['first_name']} ${snapshot.data['last_name']}',
                            style: TextStyle(color: Colors.white, fontSize: 18.0),
                          )
                        : CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/img/drawer_image.jpg'))),
    );
  }
}
