// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
//
// class GetDataScreen  extends StatefulWidget {
//   const GetDataScreen ({super.key});
//
//   @override
//   State<GetDataScreen>createState() => _GetDataScreenState();
// }
//
// class _GetDataScreenState extends State<GetDataScreen > {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo[800],
//         title: Text("GET DATA"),
//       ),
//       //backgroundColor: Colors.white[800],
//       body: Expanded(
//
//           child: FutureBuilder(
//             future: getUsersData(),
//             builder: (context, snapshot) {
//               var data = snapshot.data?.docs.toList();
//               if(snapshot.hasData){
//
//                 return ListView.builder(
//                 itemCount: data?.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                   trailing: IconButton(onPressed: (){
//                         showMyBottomSheet(data![index].id);
//                      },icon: Icon(Icons.edit),
//                   ),
//                  title: Text(data![index].data()['name'].toString()),
//                  subtitle: Text(data[index].data()['email'].toString()),
//                   );
//                 },);
//               }else{
//                 return Center(child: CircularProgressIndicator(),);
//                 }
//                       }
//           )
//
//           )
//     );
//   }
//   showMyBottomSheet(String docId){
//     showModalBottomSheet(context: context, builder: (_){
//       return Column(
//         children: [
//
//           ElevatedButton(onPressed: ()async{
//             await updateUsersData(docId);
//             Navigator.pop(context);
//
//             setState(() {
//               getUsersData();
//             });
//           }, child:Text("Update"))
//         ],
//       );
//
//     });
//   }
// }
// updateUsersData(String docId) async {
//   var firestore = FirebaseFirestore.instance;
//
//   var students = firestore.collection("students");
//   await students.doc(docId).update({
//     "name": "arti",
//     "email": "aru@gmail.com",
//     "address": "Taraiya"
//   });
// }
// Future<QuerySnapshot<Map<String, dynamic>>> getUsersData()async{
//
//   var firestore = FirebaseFirestore.instance;
//
//   var students = firestore.collection("students");
//   var data = await students.get();
//   return data;
// }
//

import 'package:flutter/material.dart';

import 'firebase_firestore_screen.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});
  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("~~ Firebase ~* FireStore ~~"),
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
                    hintText: "Enter your Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter your Phone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: phoneController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter your Gender",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: genderController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter your Age",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: ageController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter your Age",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestoreData()
                      .addStudentData(
                    nameController.text,
                    emailController.text,
                    phoneController.text,
                    genderController.text,
                    ageController.text,
                  )
                      .then((_) {
                    setState(() {
                      FirebaseFirestoreData().getStudentsData();
                    });
                  });
                },
                child: Text("Add Data")),
            Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestoreData().getStudentsData(),
                    builder: (context, snapshot) {
                      var data = snapshot.data?.docs.toList();
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            var student = data[index];
                            return Card(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(" Name:-  ${student['name']}"),
                                        Text(" Email:-  ${student['email']}"),
                                        Text(" Phone:-  ${student['phone']}"),
                                        Text(" Gender:-  ${student['gender']}"),
                                        Text(" Age:-  ${student['age']}"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 40),
                                          child: IconButton(
                                              onPressed: () {
                                                showMyButtomSheet(
                                                    data[index].id);
                                              },
                                              icon: Icon(Icons.edit)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: IconButton(
                                              onPressed: () {
                                                FirebaseFirestoreData()
                                                    .deleteStudentData(
                                                        data[index].id);
                                              },
                                              icon: Icon(Icons.delete)),
                                        ),
                                      ],
                                    )
                                  ]),
                            );
                          },
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    }))
          ],
        ),
      ),
    );
  }

  showMyButtomSheet(String docId) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController ageController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter your Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: nameController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter your Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter your Phone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: phoneController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter your Gender",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: genderController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter your Age",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                controller: ageController,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> updatedData = {
                    'name': nameController.text,
                    'email': emailController.text,
                    'phone': phoneController.text,
                    'gender': genderController.text,
                    'age': ageController.text,
                  };
                  FirebaseFirestoreData().upStudentData(docId, updatedData);
                  Navigator.of(context).pop();
                  setState(() {
                    FirebaseFirestoreData().getStudentsData();
                  });
                },
                child: Text(" UPDATA"))
          ],
        );
      },
    );
  }
}
