// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:phone_authentication/firestore_auth/firestores_login_screen.dart';
//
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({super.key});
//
//   @override
//   State<RegistrationScreen> createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//     TextEditingController emailController = TextEditingController();
//     var passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Registration Page"),
//       ),
//       body:  Center(
//         child: Column(
//           children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                       hintText: " Enter Email",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15)
//                       )
//                   ),
//                 ),
//           ),
//             const SizedBox(height: 10),
//         TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                     hintText: " Enter Password",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15)
//                     )
//                 ),
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const FirestoreLoginScreen(),));
//             }, child: const Text("Registered"))
//           ]
//         ),
//       ),
//     );
//   }
//
//   registerUser()async{
//     var firestore = FirebaseFirestore.instance;
//     var defineUser = await firestore.collection("Users").where('email',isEqualTo: emailController.text).get();
//     if(defineUser.docs.isNotEmpty){
//       Fluttertoast.showToast(msg: "Email is already define");
//     }else{
//       await firestore.collection("Users").add({
//         "email": emailController.text,
//         "password": passwordController.text
//       });
//     }
//   }
// }
