import 'package:flutter/material.dart';
import 'package:flutterfrst/Services.dart';
import 'package:flutterfrst/constant.dart';
import 'package:flutterfrst/loading.dart';

class Sign_In extends StatefulWidget {

  final Function toogleView;
  Sign_In({required this.toogleView});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();//to identify our form nd associate to the globalkey
  bool loading=false;
  String email="";
  String password="";
  String error="";
  @override
  Widget build(BuildContext context) {
    return loading? Loading() :Scaffold(//loading if true and false then scaffold
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0.0,
        title: Text('Brew Crew'),
        actions: [
          TextButton.icon(onPressed: (){
            widget.toogleView();
          }, icon: Icon(Icons.person), label: Text('Register'))
        ],
      ),
      body:Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        // child: ElevatedButton(
        //   child: Text('Sign in anon'),
        //   onPressed: ()async{
        //     dynamic result = await _auth.signInanon();
        //     if(result == null){
        //       print('error signing in');}
        //       else{
        //         print('signed in');
        //         print(result);
        //     }
        //   },
        // ),
        child:Form(
          key:_formKey,
          child:Column(
            children: [
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(prefixIcon: Icon(Icons.email)),
                validator: (val)=> val!.isEmpty ? 'Enter the email': null,//form field is valid or not
                onChanged:(val){//everytime the value changes
                  setState(() {
                    email=val;//entered value stored in email
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "password",
                  filled:true,
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white,width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400,width: 2.0),
                  ),
                ),

                validator: (val)=> val!.length < 6 ? 'Enter a password 6+ chars long': null,
                obscureText: true,
                onChanged:(val){
                  setState(() {
                    password=val;//entered value stored in password
                  });
                },
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(onPressed: () async{
                if(_formKey.currentState!.validate()){
                  setState(() {
                    loading=true;
                  });
                  dynamic result= await _auth.Signinwithemailpass(email, password);//sign in with email and password
                  if(result == null){
                    setState(() {
                      loading=false;
                      error ='could not sign in with those credentials';
                    });
                  }
                }
              }, child: Text('Sign in',style: TextStyle(color: Colors.white),)),
              SizedBox(height: 20.0,),
              Text(error,style:TextStyle(color: Colors.red,fontSize: 14.0)),
            ],
          )
        )
      )
    );
  }
}
