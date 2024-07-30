//
//  import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../../main.dart';
//
// class AuthEmailScreen extends StatefulWidget {
// const AuthEmailScreen({super.key});
//
// @override
// State<AuthEmailScreen> createState() => _AuthEmailScreenState();
// }
//
// class _AuthEmailScreenState extends State<AuthEmailScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink,
//       body: Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 40),
//               child: Text("Login Page",
//                   style: TextStyle(
//                       color: Colors.teal,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold)),
//             ),
// // Image.network("https://thumbs.dreamstime.com/b/cartoon-client-base-circle-avatar-male-female-profile-computer-screen-vector-flat-illustration-portfolio-marketing-177432439.jpg"),
//             Padding(
//               padding: EdgeInsets.all(35),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: emailController,
//                     decoration: InputDecoration(labelText: 'Enter the Email'),
//                   ),
//                   SizedBox(height: 17),
//                   TextFormField(
//                     controller: passwordController,
//                     decoration:
//                     InputDecoration(labelText: 'Enter the Password'),
//                   ),
//                   SizedBox(height: 17),
//                   ElevatedButton(
//                       onPressed: () async {
//                         try {
//                           UserCredential userCredential =
//                           await _auth.createUserWithEmailAndPassword(
//                             email: emailController.text,
//                             password: passwordController.text,
//                           );
//                           if (userCredential.user != null) {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                   const MyHomepage(
//                                     title: '',
//                                   ),
//                                 ));
//                           } else {
//                             print("not login");
//                           }
//                         } catch (e) {
//                           print(e);
//                         }
//                       },
//                       child: const Text("login in")),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
