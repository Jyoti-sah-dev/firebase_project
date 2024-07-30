import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_child_screen.dart';

class Parents_Screen extends StatefulWidget {
  const Parents_Screen({super.key});

  @override
  State<Parents_Screen> createState() => _Parents_ScreenState();
}


class _Parents_ScreenState extends State<Parents_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add_Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: ()async{
              var firestor = FirebaseFirestore.instance;
            var stortes = await firestor.collection("Parents").add({
               "name": "Santosh Sah",
               "phone": 3456599823
             });
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChildrenDetails(id:stortes.id),));
            }, child: Text("Add",)),
            ]
            ),
      )
    ) ;
  }
}

