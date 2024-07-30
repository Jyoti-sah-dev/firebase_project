// //
// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// //
// // import 'custum_widegt.dart';
// // import 'email_screen.dart';
// //
// //
// // class RegisterScreen extends StatefulWidget {
// //   @override
// //   _RegisterScreenState createState() => _RegisterScreenState();
// // }
// //
// // class _RegisterScreenState extends State<RegisterScreen> {
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //
// //   var custum=CustumWidget();
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.purple,
// //         title: Center(
// //             child: Text('Register')),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children:[
// //             custum.viewTextFild("Email",_emailController,Icons.email ),
// //             SizedBox(height: 12.0),
// //             custum.viewTextFild("Password",_passwordController, Icons.password),
// //             SizedBox(height: 12.0,),
// //             ElevatedButton(
// //
// //               onPressed: () {
// //                 _registerWithEmailAndPassword();
// //
// //               },
// //               child: Text('Register'),
// //             ),
// //
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Future<void> _registerWithEmailAndPassword() async {
// //
// //
// //     try {
// //       UserCredential userCredential =
// //       await _auth.createUserWithEmailAndPassword(
// //         email: _emailController.text.trim(),
// //         password: _passwordController.text.trim(),
// //       );
// //
// //       if (userCredential.user != null) {
// //         _navigateToHomeScreen();
// //       } else {
// //
// //       }
// //     } catch (e) {
// //
// //       print('Registration Error: $e');
// //     }
// //   }
// //
// //   void _navigateToHomeScreen() {
// //     _emailController.clear();
// //     _passwordController.clear();
// //
// //     Navigator.pushReplacement(
// //       context,
// //       MaterialPageRoute(builder: (context) =>SignInScreen()),
// //     );
// //   }
// // }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'login_screen.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             const Stack(
//               children: [
//                 ColoredBox(color: Colors.pinkAccent),
//               ],
//             ),
//             const Padding(
//               padding: EdgeInsets.only(top: 120),
//               child: Text("*Register Page*",
//                   style: TextStyle(
//                       color: Colors.pinkAccent,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold)),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(35),
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: nameController,
//                     decoration: const InputDecoration(labelText: 'Enter Your Name'),
//                   ),
//                   const SizedBox(height: 17),
//                   TextFormField(
//                     controller: emailController,
//                     decoration: const InputDecoration(labelText: 'Enter Your Email'),
//                   ),
//                   const SizedBox(height: 17),
//                   TextFormField(
//                     controller: passwordController,
//                     decoration:
//                     const InputDecoration(
//
//                         labelText: 'Enter Your Password'),
//                   ),
//                   const SizedBox(height: 17),
//                   ElevatedButton(
//                       onPressed: () async {
//                         try {
//                           UserCredential userCredential =
//                           await _auth.createUserWithEmailAndPassword(
//                             email: emailController.text,
//                             password: passwordController.text,);
//                           if (userCredential.user != null) {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
//                           } else {
//                             print("not login");
//                           }
//                         } catch (e) {
//                           Fluttertoast.showToast(msg: "${e}");
//                         }
//                       }, child: const Text("Register")),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   register()async{
//     try {
//       UserCredential  userCredential = await _auth.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//       if(userCredential.user == null){
//         Fluttertoast.showToast(msg: "Registered Successfully");
//       }else{
//         Fluttertoast.showToast(msg: "Somethin Went Wrong");
//       }
//     }
//     catch(e){
//       print(e);
//     }
//   }
// }