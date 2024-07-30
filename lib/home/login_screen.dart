// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'mycurrent_loaction.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginScreen(),
//     );
//   }
// }
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlueAccent,
//         title: Center(child: Text('Login Authenitication')),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             children: <Widget>[
//               SizedBox(height: 30),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                     hintText: "Email",
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15)
//                     )
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                     hintText: 'Password',
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15)
//                     )
//                 ),
//               ),
//               SizedBox(height: 20),
//               MaterialButton(
//                 color: Colors.lightBlue,
//                 onPressed: () async {
//                   String email = emailController.text.trim();
//                   String password = passwordController.text.trim();
//                   try {
//                     final UserCredential userCredential =
//                     await _auth.signInWithEmailAndPassword(
//                       email: email,
//                       password: password,
//                     );
//                     if (userCredential.user != null) {
//                       Navigator.push( context, MaterialPageRoute(builder: (context) =>HomePage()));
//                     }
//                     else {
//                       Fluttertoast.showToast(msg: "Please enter email and password");
//                     }
//                   }
//                   catch (e) {
//                     print('Error: $e');
//                     Fluttertoast.showToast(msg: "worng email and password");
//                   }
//                 },
//                 child: Text('Login'),
//               ),
//               SizedBox(height: 20),
//               MaterialButton(
//                   color: Colors.lightBlueAccent,
//                   onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder:(context) => RagistrationScreen(),));
//                   }, child: Text("Register")
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// RagistrationScreen() {
//
// }