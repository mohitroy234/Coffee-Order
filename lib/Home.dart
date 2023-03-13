import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfrst/Services.dart';
import 'package:flutterfrst/database.dart';
import 'package:flutterfrst/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutterfrst/Brew_list.dart';
import 'package:flutterfrst/Brew.dart';

class Home extends StatelessWidget {
  final AuthServices _auth =AuthServices();

  @override
  Widget build(BuildContext context) {

    void _showSettingPanel(){
      showModalBottomSheet(context: context, builder:(context){
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
        child:SettingForm(),
      );
      });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseServices(uid: '').brews,
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown.shade50,
        appBar: AppBar(
          title:Text('Brew Crew'),
          backgroundColor: Colors.brown.shade400,
          elevation: 0.0,
          actions: [
            TextButton.icon(onPressed: () async{
              await _auth.SignOut();
            }, icon: Icon(Icons.person),label: Text('Logout',style: TextStyle(color: Colors.white),),),
            TextButton.icon(onPressed: (){
              _showSettingPanel();
            }, icon: Icon(Icons.settings), label: Text('settings'))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back.jpeg'),
              fit: BoxFit.cover
            )
          ),
            child: BrewList()),
      ),
    );
  }
}
