import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfrst/Services.dart';
import 'package:flutterfrst/Wrapper.dart';
import 'package:provider/provider.dart';
import 'package:flutterfrst/models.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<logUser?>.value(
      value: AuthServices().user,
        initialData: null,
        child: MaterialApp(home:Wrapper()));

  }
}

