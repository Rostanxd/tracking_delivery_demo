import 'package:flutter/material.dart';

class ManagerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ManagerPageState();

}

class _ManagerPageState extends State<ManagerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Text('Administrador'),
        ),
      ],
    );
  }

}