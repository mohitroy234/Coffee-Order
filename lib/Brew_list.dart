

import 'package:flutterfrst/BrewTile.dart';
import 'Brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews =Provider.of<List<Brew>>(context)??[];
    // print(brews.docs);
    // if(brews!=null) {
    //   for (var doc in brews.docs) { //cycle through each doc of brew and print the data
    //     print(doc.data());
    //   }
    // }
    // brews.forEach((brew) {
    //   print(brew.name);
    //   print(brew.sugars);
    //   print(brew.Strength);
    // });
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context,index){
        return BrewTile(brew: brews[index],);
      },

    );
  }
}
