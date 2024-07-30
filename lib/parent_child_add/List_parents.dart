import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'child_Screen.dart';

class Listparents extends StatefulWidget {
  const Listparents({super.key});

  @override
  State<Listparents> createState() => _ListparentsState();
}

class _ListparentsState extends State<Listparents> {
  TextEditingController  nameController = TextEditingController();
  TextEditingController  emailController = TextEditingController();
  TextEditingController  phoneController = TextEditingController();
  TextEditingController  GenderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("~~* Child *~~",style: TextStyle(
              color: Colors.white
          ),),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    body: Center(
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.all(7),
    child: TextFormField(
    decoration: InputDecoration(
    hintText: "Enter your Name",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10))),
    controller: nameController,
    ),
    ),

    Padding(
    padding: const EdgeInsets.all(7),
    child: TextFormField(
    decoration: InputDecoration(
    hintText: "Enter your email",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10))),
    controller: nameController,
    ),
    ),

    Padding(
    padding: const EdgeInsets.all(7),
    child: TextFormField(
    decoration: InputDecoration(
    hintText: "Enter your phone",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10))),
    controller: nameController,
    ),
    ),

    Padding(
    padding: const EdgeInsets.all(7),
    child: TextFormField(
    decoration: InputDecoration(
    hintText: "Enter your Gender",
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10))),
    controller: nameController,
    ),
    ),

    StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return ElevatedButton(onPressed: (){
                  var stortes;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => childScreen(id:stortes.id),));

                }, child: Text("Add Parents"));
              }
          )
        ],
      ),
    )
    );
  }
}

class AddParents {
  var firebase = FirebaseFirestore.instance;
}
