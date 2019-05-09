import 'package:flutter/material.dart';

class DispatcherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DispatcherPageState();

}

class _DispatcherPageState extends State<DispatcherPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Text('Despachador'),
        ),
      ],
    );
  }

}