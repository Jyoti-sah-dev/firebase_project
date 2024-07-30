//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'home_screen.dart';
// import 'login_screen.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// // class _SplashScreenState extends State<SplashScreen> {
//
//   @override
//   void initState() {
//     Future.delayed(const Duration(seconds: 3)).then((value) => checkUserLogin());
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Padding(padding: EdgeInsets.all(60),
//             child: CircularProgressIndicator(color: Colors.teal,)),
//       ),
//     );
//   }
//   checkUserLogin(){
//     var auth = FirebaseAuth.instance;
//     if(auth.currentUser != null){
//       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
//         builder: (context) =>  MyHomePage(title: "MyHome"),), (route) => false);
//     }
//     else{
//       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
//         builder: (context) =>  LoginScreen(),), (route) => false);
//     }
//   }
// }