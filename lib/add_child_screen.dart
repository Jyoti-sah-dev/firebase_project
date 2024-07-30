import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChildrenDetails extends StatefulWidget {
  final String id;
  const ChildrenDetails({super.key, required this.id});

  @override
  State<ChildrenDetails> createState() => _ChildrenDetailsState();
}

class _ChildrenDetailsState extends State<ChildrenDetails> {
  TextEditingController addlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: addlController,
              decoration: InputDecoration(
                  hintText: " Enter Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            var store = FirebaseFirestore.instance;
            store.collection("childData").add({
              "name": "jyoti kumari",
              "emial": "jyoti@gmail.com"
            });
          }, child: Text("AddId"))
        ],
      ),
    );
  }
}

 addchildScreen ()async{
  var firestore = FirebaseFirestore.instance;
  var emailController;
  var add = await firestore.collection (emailController.text).get();
 if (add.docs.isEmpty);
}