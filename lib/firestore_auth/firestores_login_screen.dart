// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
//
// import 'firestore_ragister_screen.dart';
//
// class FirestoreLoginScreen extends StatefulWidget {
//   const FirestoreLoginScreen({super.key});
//
//   @override
//   State<FirestoreLoginScreen> createState() => _FirestoreLoginScreenState();
// }
//
// class _FirestoreLoginScreenState extends State<FirestoreLoginScreen> {
//   TextEditingController emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Login Page"),
//       ),
//       body:  Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                     hintText: " Enter Email",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(35)
//                     )
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                     hintText: " Enter Password",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(35)
//                     )
//                 ),
//               ),
//             ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 180,top: 15),
//                   child: TextButton(onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen(),));
//                   }, child: const Text(" Forgot your Password")),
//                 ),
//
//              const SizedBox(height: 16),
//             ElevatedButton(
//                 onPressed: (){
//                   logonUser();
//                 },
//                 child: const Text("Login")),
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   logonUser()async {
//     var firestore = FirebaseFirestore.instance;
//     var defineUser = await firestore.collection("Users").where(
//         'email', isEqualTo: emailController.text).get();
//     if (defineUser.docs.isNotEmpty) {
//       var isValidUser = defineUser.docs.firstWhere((user)=>user.data()['password'] == passwordController.text).exists;
//       if(isValidUser){
//       Fluttertoast.showToast(msg: "Login Successful");
//     } else {
//         Fluttertoast.showToast(msg: "you are not registered Successful");
//     }
//    }
//   }
//
// //   registerUser()async{
// //     var firestore = FirebaseFirestore.instance;
// //     var defineUser = await firestore.collection("Users").where('email',isEqualTo: emailController.text).get();
// //     if(defineUser.docs.isNotEmpty){
// //       Fluttertoast.showToast(msg: "Email is already define");
// //     }else{
// //       await firestore.collection("Users").add({
// //         "email": emailController.text,
// //         "password": passwordController.text
// //       });
// //     }
// //   }
//  }
