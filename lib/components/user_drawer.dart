import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracking_delivery_demo/blocs/root_bloc.dart';

class UserDrawer extends StatelessWidget {
  final FirebaseUser _user;
  final RootBloc _rootBloc;

  UserDrawer(this._user, this._rootBloc);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _header(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              _rootBloc.userLogOut();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text('Salir'),
          ),
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
                margin: EdgeInsets.only(left: 10.0, right: 20.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/user_one.jpg')))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    '${_rootBloc.user.value.firstName} ${_rootBloc.user.value.lastName}',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                Container(
                  child: Text(
                    _user.email,
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ),
                Container(
                  child: Text(
                    '${_rootBloc.user.value.roleName}',
                    style: TextStyle(color: Colors.white, fontSize: 14.0),
                  ),
                ),
              ],
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
