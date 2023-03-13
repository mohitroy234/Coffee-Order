import 'package:flutter/material.dart';
import 'package:flutterfrst/Brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({required this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child:Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0,20.0,0.0),
        child:ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.Strength],
            backgroundImage: AssetImage('assets/cup.jpeg'),
          ),
          title: Text(brew.name),
          subtitle: Text('Take ${brew.sugars} sugar(s)'),
        )
      )
    );
  }
}
