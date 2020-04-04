import 'package:flutter/material.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: new Image.asset('images/covid.png',scale: 3,),
          ),
          Text('Version 1.0',
          style: TextStyle(
            color: Colors.white,fontSize: 20
          ),),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 100,
            height: 10,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
