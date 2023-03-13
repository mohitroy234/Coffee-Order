import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfrst/Brew.dart';
import 'package:flutterfrst/models.dart';

class DatabaseServices{
   final String uid;
   DatabaseServices({required this.uid});//create instance of the database services
   final CollectionReference brewCollection =FirebaseFirestore.instance.collection('brews');//collection of brews data in database
   Future updateUserData(String sugars,String name,int strength)async{//get the data from the user at first
      return await brewCollection.doc(uid).set({
         'sugars': sugars,
         'name': name,
         'Strength': strength,
      });
   }
   //brew list from snapshot
   List<Brew>_brewListfromSnapshot(QuerySnapshot snapshot){
      return snapshot.docs.map((doc) {
         return Brew(
            name: doc.get('name')??"",
            sugars:doc.get('sugars')??'0',
            Strength:doc.get('Strength')??0,

         );
      }).toList();
   }
//user data from snapshot
   UserData _userdatafromsnapshot(DocumentSnapshot snapshot){
      return UserData(uid: uid, name: snapshot.get('name'), sugars: snapshot.get('sugars'), Strength: snapshot.get('Strength'));
   }

   //get brews stream
Stream<List<Brew>> get brews{
   return brewCollection.snapshots().map(_brewListfromSnapshot);
}
//get user doc stream
Stream<UserData> get userData{
      return brewCollection.doc(uid).snapshots().map(_userdatafromsnapshot);
}
}
