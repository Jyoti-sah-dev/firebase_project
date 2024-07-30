import 'package:flutter/material.dart';

class childScreen extends StatefulWidget {
  const childScreen({super.key, required id});

  @override
  State<childScreen> createState() => _childScreenState();
}

class _childScreenState extends State<childScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("~~* Parents *~~",style: TextStyle(
            color: Colors.white
          ),),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(7),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                  )),
            ),
          ),
          StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return ElevatedButton(onPressed: (){
              
              }, child: Text("Add Parents"));
            }
          )
        ],
      ),
    );
  }
}
