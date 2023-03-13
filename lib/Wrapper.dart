import 'package:flutter/material.dart';
import 'package:flutterfrst/Authenticate.dart';
import 'package:flutterfrst/Home.dart';
import 'package:flutterfrst/models.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users=Provider.of<logUser?>(context);//user login ya logout ka value logout ->null

    if(users==null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
