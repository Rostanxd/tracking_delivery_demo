import 'package:flutter/material.dart';

class DriverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DriverPageState();

}

class _DriverPageState extends State<DriverPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Text('Conductor'),
        ),
      ],
    );
  }

}