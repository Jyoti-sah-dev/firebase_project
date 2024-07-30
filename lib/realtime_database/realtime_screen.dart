import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeScreen extends StatefulWidget {
  const RealtimeScreen({super.key});

  @override
  State<RealtimeScreen> createState() => _RealtimeScreenState();
}

class _RealtimeScreenState extends State<RealtimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Real Time Data Base"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
            realTimeDatabase();
          }, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Add"),
          )),
          ElevatedButton(onPressed: (){
            realTimeDatabase();
          }, child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Add"),)

          ),

        ],
      ),
    );

  }
  realTimeDatabase()async{
    var  realTime = await
    FirebaseDatabase.instance.ref("users").child("first");
        realTime.set({
      "name": "Jyoti kumari",
    "email": "jyotiedugaon@gmail.com",
      "phone": 2547849763
    });

 await realTime.child("Address").set({
        "village": "NandanPur",
        "post": "Gawandari",
        "Distic" : "Bihar",
    });
 await realTime.child("gender").set({
   "male": "True",
   "fimale": "false",
 });


  }
}
