import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracking_delivery_demo/components/user_drawer.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser _user;

  HomePage(this._user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      drawer: UserDrawer(widget._user),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .document(widget._user.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');

          return Center(
            child: snapshot.hasData
                ? checkRole(snapshot.data)
                : CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Center checkRole(DocumentSnapshot snapshot) {
    switch (snapshot.data['role']) {
      case '99':
        return systemPage(snapshot);
        break;
      case '98':
        return designPage(snapshot);
        break;
      default:
        return Center(child: Text(snapshot.data['first_name']));
    }
  }

  /// Pages
  Center systemPage(DocumentSnapshot snapshot) {
    return Center(child: Text('Sistemas'));
  }

  Center designPage(DocumentSnapshot snapshot) {
    return Center(child: Text('Diseño'));
  }
}
