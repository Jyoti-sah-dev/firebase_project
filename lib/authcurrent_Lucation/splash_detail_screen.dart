// import 'package:firebase_project/authcurrent_Lucation/show_register_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'mycurrent_loaction.dart';
//
// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(Duration.zero, () async {
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         // User is logged in, show LocationDetailsScreen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => LocationDetailsScreen(userId: user.uid)),
//         );
//       } else {
//         // User is not logged in, show RegistrationScreen
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => RegistrationScreen()),
//         );
//       }
//     });
//
//     return Scaffold(
//       body: Center(child: CircularProgressIndicator()), // Splash screen loading indicator
//     );
//   }
// }