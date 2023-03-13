
import 'package:flutter/material.dart';
import 'package:flutterfrst/constant.dart';
import 'package:flutterfrst/database.dart';
import 'package:flutterfrst/loading.dart';
import 'package:flutterfrst/models.dart';
import 'package:provider/provider.dart';


class SettingForm extends StatefulWidget {
  const SettingForm({Key? key}) : super(key: key);

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {

  final _formKey= GlobalKey<FormState>();
  final List<String> sugars=['0','1','2','3','4'];
  String? _currentName;
   String? _currentSugar;
   int? Strength;
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<logUser>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseServices(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData? userData= snapshot.data;
          return Form(
              key: _formKey,//uniquely identify the form and allows you to do the validation
              child: Column(
                children: [
                  Text(
                    'update your brew settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 30.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: '',prefixIcon:Icon(Icons.person)),
                    validator: (val)=>val!.isEmpty?'Please enter a name':null,
                    onChanged: (val)=>setState(() {
                      _currentName=val;
                    }),
                  ),
                  SizedBox(height: 30.0,),
                  //dropdown
                  DropdownButtonFormField(
                    decoration: textInputDecoration.copyWith(hintText: ''),
                    value: _currentSugar?? userData!.sugars,
                    items: sugars.map((sugar){
                      return DropdownMenuItem(value:sugar,child: Text('$sugar sugars'));
                    }).toList(), onChanged: (val)=>setState(() {
                    _currentSugar=val!;
                  }),
                  ),
                  SizedBox(height: 30.0,),
                  //slider
                  Slider(min: 100,
                    max: 900,
                    divisions: 8,
                    activeColor: Colors.brown[Strength ?? userData!.Strength],
                    inactiveColor: Colors.brown[Strength ??userData!.Strength],
                    value:(Strength??100).toDouble() , onChanged: (val)=>setState(() {
                      Strength=val.round();
                    }),),
                  SizedBox(height: 10.0,),
                  ElevatedButton(onPressed: ()async{
                    if(_formKey.currentState!.validate()){
                      await DatabaseServices(uid: user.uid).updateUserData(_currentSugar ?? userData!.sugars, _currentName ?? userData!.name, Strength??userData!.Strength);
                      Navigator.pop(context);
                    }
                  }, child: Text('Update',style: TextStyle(color: Colors.white)),)
                ],
              ));
        }
        else{
         return Loading();
        }
      }
    );
  }
}
