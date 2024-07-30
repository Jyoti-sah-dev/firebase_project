// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../homescreen.dart';
// import 'custum_widegt.dart';
// import 'mixin_class.dart';
//
//
// class SignInScreen extends StatefulWidget {
//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   var custom = CustumWidget();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.blueGrey,
//         title: const Text('Email and Passwod',style: TextStyle(color: Colors.white),),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image:NetworkImage("https://media.istockphoto.com/id/1334563669/photo/pastel-colored-light-blue-backgrounds.webp?b=1&s=170667a&w=0&k=20&c=UZIEIaH1WsCUBmWktGvGqAIuSTUoWpXDTXOD25u1ODs="),
//             // Replace with your image path
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               custom.viewTextFild(" Email", _emailController,Icons.email),
//               const SizedBox(height: 12.0),
//               custom.viewTextFild(" Password", _passwordController,Icons.visibility_off),
//               const SizedBox(height: 12.0),
//               const SizedBox(height: 12.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   try {
//                     UserCredential userCredential =
//                     await _auth.signInWithEmailAndPassword(
//                       email: _emailController.text,
//                       password: _passwordController.text,
//                     );
//
//                     if (userCredential.user != null) {
//                       Get.to(HomeScreen());
//                     } else {
//                       print("User not verified");
//                     }
//                   } catch (e) {
//                     print('Sign In Error: $e');
//                   }
//                 },
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
