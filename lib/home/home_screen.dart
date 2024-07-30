// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'login_screen.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Center(child: Text("done")),
//       ),
//       body: Column(
//         children: [
//           Image.network(""),
//           SizedBox(height: 50),
//           ElevatedButton(onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => LoginScreen(),));
//             FirebaseAuth.instance.signOut();
//             var auth = FirebaseAuth.instance;
//             if (auth.currentUser == null) {
//               auth.signOut();
//             }
//           }, child: Text("Sing out")),
//         ],
//       ),
//     );
//   }
// }