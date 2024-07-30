// // import 'package:flutter/material.dart';
// //
// // class CustumWidget{
// //   viewTextFild(String name,TextEditingController controoler,IconData icon){
// //     return TextField(
// //       controller: controoler,
// //       decoration: InputDecoration(
// //           prefix: Icon(icon),
// //           hintText: name,
// //           border: const OutlineInputBorder(
// //
// //               borderRadius: BorderRadius.all(Radius.circular(20))
// //           )
// //       ),);
// //   }
// // }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
//
// import '../homescreen.dart';
// import 'mixin_class.dart';
// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   var custom = CustumWidget();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Color(0xff8889095680),
//         title: Text('Register',style: TextStyle(color: Colors.white),),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage("https://plus.unsplash.com/premium_photo-1681487916420-8f50a06eb60e?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               custom.viewTextFild("Email", _emailController, Icons.email),
//               SizedBox(height: 12.0),
//               custom.viewTextFild(
//                   "Password", _passwordController, Icons.visibility_off),
//               SizedBox(height: 12.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   try {
//                     UserCredential userCredential =
//                     await _auth.createUserWithEmailAndPassword(
//                       email: _emailController.text,
//                       password: _passwordController.text,
//                     );
//
//                     if (userCredential.user != null) {
//
//                       Get.to(HomeScreen());
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('Registration failed. Please try again.'),
//                         ),
//                       );
//                     }
//                   } catch (e) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Registration failed alredy  exsits email and password'),
//                       ),
//                     );
//                     print('Registration Error: $e');
//                   }
//                 }, child: Text("Registerd"),
//
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//
// }