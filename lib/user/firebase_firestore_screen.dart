// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// class firestore extends StatefulWidget {
//   const firestore({super.key});
//
//   @override
//   State<firestore> createState() => _firestoreState();
// }
//
// class _firestoreState extends State<firestore> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController genderControllor = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//
//   @override
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: const Center(child: Text("~* FireStore *~")),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(40),
//           child: Column(
//             children: [
//               // SizedBox(
//               //   height: 10,
//               // ),
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                     labelText: 'Enter Your Name',
//                     hoverColor: Colors.teal,
//                     prefixIcon: const Icon(
//                       Icons.person,
//                       color: Colors.teal,
//                     ),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18))),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                     hoverColor: Colors.teal,
//                     prefixIcon: const Icon(
//                       Icons.email,
//                       color: Colors.teal,
//                     ),
//                     labelText: 'Enter Your Email',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18))),
//               ),
//
//               const SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 controller: phoneController,
//                 decoration: InputDecoration(
//                     hoverColor: Colors.teal,
//                     prefixIcon: const Icon(
//                       Icons.phone,
//                       color: Colors.teal,
//                     ),
//                     labelText: 'Enter Your Number',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18))),
//               ),
//
//               const SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 controller: genderControllor,
//                 decoration: InputDecoration(
//                     hoverColor: Colors.teal,
//                     prefixIcon: const Icon(
//                       Icons.person_search_outlined,
//                       color: Colors.teal,
//                     ),
//                     labelText: 'Enter You Gender ',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(18))),
//               ),
//
//               const SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 controller: ageController,
//                 decoration: InputDecoration(
//                     labelText: 'Enter you age',
//                     hoverColor: Colors.teal,
//                     prefixIcon: const Icon(Icons.man, color: Colors.teal),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(18),
//                     )),
//               ),
//               const SizedBox(height: 10),
//               MaterialButton(
//                   color: Colors.teal,
//                   onPressed: () {
//                     addUser(
//                         nameController.text,
//                         emailController.text,
//                         phoneController.text,
//                         genderControllor.text,
//                         ageController.text);
//                   },
//                   child: const Text(
//                     " Data Add",
//                   )),
//               const SizedBox(height: 8),
//               MaterialButton(
//                   color: Colors.teal,
//                   onPressed: () {
//                     getStudentData();
//                   },
//                   child: const Text(
//                     " Get data",
//                     style: TextStyle(color: Colors.white),
//                   )),
//               Expanded(
//                   child: FutureBuilder(
//                       future: getStudentData(),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return CircularProgressIndicator(strokeWidth: 0.3,);
//                         } else if (snapshot.hasError) {
//                           return Center(
//                             child: Text('Error: ${snapshot.error}'),
//                           );
//                         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                           return Center(
//                             child: Text('No students Found'),
//                           );
//                         } else {
//                           var data = snapshot.data!;
//                           return ListView.builder(
//                               itemCount: data.length,
//                               itemBuilder: (context, index) {
//                                 var student = data[index];
//                                 {
//                                   return Column(
//                                     children: [
//                                       Text("Name:- ${student['name']}"),
//                                       Text("Email:- ${student['name']}"),
//                                       Text("Phone:- ${student['name']}"),
//                                       Text("Gender:- ${student['name']}"),
//                                       Text("Age:- ${student['name']}"),
//                                     ],
//                                   );
//                                 }
//                               });
//                         }
//                       }))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// addUser(
//     String name, String email, String phone, String gender, String age) async {
//   var firestore = FirebaseFirestore.instance;
//   firestore.collection("users").add({
//     "name": name,
//     "phone": 3456790056,
//     "email": email,
//     "gender": gender,
//     "age": age,
//   }).catchError((error)=> print("failed to add Users: $error"));
// }
// Future<List<Map<String,dynamic>>>getStudentData()async{
//    var storedata = FirebaseFirestore.instance;
//     var snapshot =await storedata.collection("Users").get();
//     return snapshot .docs.map((doc) => doc.data()as Map<String ,dynamic>).toList();
//
// }
//
//
//
//
//
// //
// // getUser() async {
// //   var firestores = FirebaseFirestore.instance;
// //   await firestores.collection("users").get().then((value) => print("not get"));
// //   doc("docId").get().then((DocumentSnapshot documentSnapshot) {
// //     if (documentSnapshot.exists) {
// //       print('Document data: ${documentSnapshot.data()}');
// //     } else {
// //       print('Document does not exist');
// //     }
// //   });
// // }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'get_data_screen.dart';
//
// class CreateFireStore extends StatefulWidget {
//   const CreateFireStore({super.key});
//
//   @override
//   State<CreateFireStore> createState() => _CreateFireStoreState();
// }
//
// class _CreateFireStoreState extends State<CreateFireStore> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController genderController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal[900],
//         title: const Center(
//             child: Text(
//           "~* FireBase Store *~",
//           style: TextStyle(color: Colors.white),
//         )),
//       ),
//       body: Center(
//           child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: nameController,
//               decoration: InputDecoration(
//                   labelText: 'Enter Name',
//                   hoverColor: Colors.teal,
//                   prefixIcon: const Icon(Icons.perm_identity),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(24))),
//             ),
//             const SizedBox(height: 15),
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(
//                   labelText: 'Enter Email',
//                   prefixIcon: const Icon(Icons.email),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(24))),
//             ),
//             const SizedBox(height: 15),
//             TextFormField(
//               controller: ageController,
//               decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.phone),
//                   labelText: 'Enter Age',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(24))),
//             ),
//             const SizedBox(height: 15),
//             TextFormField(
//               controller: genderController,
//               decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.person),
//                   labelText: 'Enter Gender',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(24))),
//             ),
//             const SizedBox(height: 15),
//             TextFormField(
//               controller: phoneController,
//               decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.phone_iphone_outlined),
//                   labelText: 'Enter phone',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(24))),
//             ),
//             const SizedBox(height: 10),
//             MaterialButton(
//                 color: Colors.teal,
//                 onPressed: () {
//                   addUsersData(
//                           nameController.text,
//                           emailController.text,
//                           ageController.text,
//                           genderController.text,
//                           phoneController.text)
//                       .than((_) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const GetDataScreen(),
//                         ));
//                   });
//                 },
//                 child: const Text(
//                   "Add Users",
//                   style: TextStyle(color: Colors.white),
//                 )),
//             const SizedBox(height: 20),
//             MaterialButton(
//                 color: Colors.teal,
//                 onPressed: () {
//                   getUsersData();
//                 },
//                 child: const Text(
//                   "Get Users",
//                   style: TextStyle(color: Colors.white),
//                 )),
//           ],
//         ),
//       )),
//     );
//   }
//
//   showMyBottomSheet(String docId) {
//     showModalBottomSheet(
//         context: context,
//         builder: (_) {
//           return Column(
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   await updateUsersData(docId);
//                   Navigator.pop(context);
//
//                   setState(() {
//                     genderController;
//                   });
//                 },
//                 child: Text("Update"),
//               )
//             ],
//           );
//         });
//   }
// }
//
// addUsersData(
//   String name,
//   String email,
//   String age,
//   String gender,
//   String phone,
// ) async {
//   var firestore = FirebaseFirestore.instance;
//   var students = firestore.collection("students");
//   // call add method to add data
//   await students.add({
//     "name": name,
//     "email": "jyoti@gmail.com",
//     "phone": 541334536543,
//     "gender": "Female",
//     "age": 34.6
//   }).then((ref) {
//     Fluttertoast.showToast(msg: ref.id);
//     print("DocId; ${ref.id}");
//   }).catchError((FirebaseException error) {
//     Fluttertoast.showToast(msg: "${error.code}");
//   });
// }
// showMyBottomSheet(String docId){
//   var context;
//   showModalBottomSheet(context: context, builder: (_){
//     return Column(
//       children: [
//
//         ElevatedButton(onPressed: ()async{
//           await updateUsersData(docId);
//           Navigator.pop(context);
//
//         }, child:Text("Update"))
//       ],
//     );
//
//   });
//
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseFirestoreData {

  var collectionName = "students";
  var firebase = FirebaseFirestore.instance;

  addStudentData(
      String name,
      String email,
      String phone,
      String gender,
      String age,
      ) async {
    await firebase.collection(collectionName)
        .add(({
      "name": name,
      "email": email,
      "phone": phone,
      "gender": gender,
      "age": age
    }))
        .then((refe) {
      Fluttertoast.showToast(msg: "Document${refe.id}");
      print("Document${refe.id}");
    }).catchError((error) {
      Fluttertoast.showToast(msg: "${error}");
    });
  }
  Stream <QuerySnapshot<Map<String, dynamic>>> getStudentsData(){
    var firestore = FirebaseFirestore .instance ;
 var students = firestore.collection(collectionName);
    var data = students.snapshots();
    return data;
  }


  Future<void> upStudentData(String docId, Map<String, dynamic> upData) async {
    await firebase.collection(collectionName).doc(docId).update(upData);
  }
  Future<void> deleteStudentData(String docId,)async{
    await firebase.collection(collectionName).doc(docId).delete();
  }
}