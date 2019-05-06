import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final FirebaseUser _user;

  MyHomePage(this._user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('users').document(widget._user.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError)
            return Text('Error: ${snapshot.error}');

          return Center(
            child: snapshot.hasData ?
                Text(snapshot.data['first_name']) : CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
