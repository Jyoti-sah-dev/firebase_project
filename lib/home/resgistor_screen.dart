// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// //
// // import '../google/google_screen.dart';
// //
// // class RagistrationScreen extends StatefulWidget {
// //   const RagistrationScreen({super.key});
// //
// //   @override
// //   State<RagistrationScreen> createState() => _RagistrationScreenState();
// // }
// //
// // class _RagistrationScreenState extends State<RagistrationScreen> {
// //   TextEditingController emailController = TextEditingController();
// //   TextEditingController passwordController = TextEditingController();
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.tealAccent,
// //         title: Center(child: Text("Registration Authentication")),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             TextField(
// //               controller: emailController,
// //               decoration: InputDecoration(
// //                 hintText: "Email",
// //                 icon: Icon(Icons.email),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(15),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 10),
// //             TextField(
// //               controller: passwordController,
// //               decoration: InputDecoration(
// //                 hintText: "Password",
// //                 icon: Icon(Icons.lock),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(15),
// //                 ),
// //               ),
// //               // obscureText: true,
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 String email = emailController.text.trim();
// //                 String password = passwordController.text.trim();
// //                 if (email.isNotEmpty && password.isNotEmpty) {
// //                   registration(email, password);
// //                 } else {
// //                   Fluttertoast.showToast(
// //                       msg: "Please enter email and password");
// //                 }
// //               },
// //               child: Text("Registration"),
// //               // style: ElevatedButton.styleFrom(
// //               // ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void registration(String email, String password) async {
// //     try {
// //       UserCredential userCredential =
// //           await _auth.createUserWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );
// //       if (userCredential.user != null) {
// //         Fluttertoast.showToast(msg: "Registration successful");
// //         Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => GoogleSignInScreen(),
// //             ));
// //       } else {
// //         Fluttertoast.showToast(msg: "Registration failed");
// //       }
// //     } catch (e) {
// //       Fluttertoast.showToast(msg: "Error: $e");
// //     }
// //   }
// // }
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import '../email_password_auth/custum_widegt.dart';
// import '../email_password_auth/login_screen.dart';
// import '../email_password_auth/mixin_class.dart';
// class LogInScreen extends StatefulWidget {
//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<LogInScreen> {
//   // final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   var custom = CustumWidget();
//
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   Future<User?> _signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     if (googleUser != null) {
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       final UserCredential userCredential =
//       await _auth.signInWithCredential(credential);
//
//
//       User? user = userCredential.user;
//       if (user != null) {
//       }
//
//       return user;
//     }
//
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.blueGrey,
//         title: const Text(
//           'Email and Password',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//
//           children: [
//             custom.viewTextFild("Email", _emailController, Icons.email),
//             SizedBox(height: 12.0),
//             custom.viewTextFild("Password", _passwordController, Icons.visibility_off),
//             SizedBox(height: 60),
//             MaterialButton(
//               shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
//               color: Colors.blueGrey,
//               minWidth: 320,
//               height: 50,
//               onPressed: () async {
//                 try {
//                   UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//                     email: _emailController.text,
//                     password: _passwordController.text,
//                   );
//
//                   if (userCredential.user != null) {
//                     Get.to(HomeScreen());
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Sign in failed. User not found.'),
//                       ),
//                     );
//                   }
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text(
//                         'Please first register then login',
//                         style: TextStyle(color: Colors.red, fontSize: 20),
//                       ),
//                       backgroundColor: Colors.black,
//                     ),
//                   );
//                   print('Sign In Error: $e');
//                 }
//               },
//               child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20),),
//             ),
//             SizedBox(height: 20,),
//             MaterialButton(
//               color: Colors.blueGrey,
//               height: 50,
//               shape: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
//               minWidth:320 ,
//               onPressed: () {
//                 Get.to(RegisterScreen());
//               },
//               child: Text("Register",style: TextStyle(color: Colors.white,fontSize: 20),),
//             ),
//
//             ElevatedButton(
//               onPressed: () async {
//                 var   user = await _signInWithGoogle();
//                 if (user != null) {
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: Text('Profile Information'),
//                       content: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           if (user.photoURL != null)
//                             Image.network(user.photoURL!),
//                           SizedBox(height: 8),
//                           Text('Name: ${user.displayName ?? "No name"}'),
//                           SizedBox(height: 4),
//                           Text('Email: ${user.email ?? "No email"}'),
//                         ],
//                       ),
//                       actions:[
//                         TextButton(
//
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('Close'),
//                         ),
//                       ],
//                     ),
//                   );
//                 } else {
//                   print('Login failed.');
//                 };
//               },
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Image.network(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqjph0aZTXAApY940gnEDRx-wjIZuCRF97KBANoTrIVDqcUCYmgeFTiZ25ZUxxznkhtZg&usqp=CAU ',
//                     height: 24.0,
//                   ),
//                   SizedBox(width: 10),
//                   Text('Sign in with Google'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }