import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
            child: Text(
              'Sistema',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          ListTile(
            title: Text('Usuarios'),
            leading: Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Icon(Icons.supervised_user_circle)),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
            child: Text(
              'Logística',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          ListTile(
            title: Text('Conductores'),
            leading: Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Icon(Icons.person_outline)),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
          ListTile(
            title: Text('Vehículos'),
            leading: Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Icon(Icons.directions_car)),
            trailing: Icon(Icons.navigate_next),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
