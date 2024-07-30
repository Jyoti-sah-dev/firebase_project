// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import 'login_screen.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required String title});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   Future<User?> _signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//
//     if (googleUser != null) {
//       final GoogleSignInAuthentication googleAuth =
//       await googleUser.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       final UserCredential userCredential =
//       await _auth.signInWithCredential(credential);
//
//       User? user = userCredential.user;
//       return user;
//     }
//
//     return null;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Conirmation Screen"),
//       ),
//       body: Container(
//         width: 500,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage("https://c-nergy.be/blog/wp-content/gallery/ubuntu-18-04/PurpleScreen_1.png"),
//             fit: BoxFit.cover,
//           ),
//
//         ),
//         child:
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(40),
//               child: MaterialButton(
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//                   height: 50,
//                   color: Colors.teal,
//                   onPressed: (){
//                     var auth = FirebaseAuth.instance;
//                     if(auth.currentUser != null){
//                       auth.signOut();
//                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen(),), (route) => false);
//                     }else{
//                       Fluttertoast.showToast(msg: "You are not Login",
//                         backgroundColor: Colors.yellow,
//                         textColor: Colors.red,
//                       );
//                     }
//                   }, child: const Text("LogOut",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
//             ),
//
//             MaterialButton(
//               color: Colors.purple,
//               height: 60,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//               onPressed: () async {
//                 User? user = await _signInWithGoogle();
//                 if (user != null) {
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: const Text('Profile Information'),
//                       content: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Image.network(
//                             'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
//                             height: 100,
//                             width: 100,
//                           ),
//                           const SizedBox(height: 8),
//                           if (user.photoURL != null)
//                             Image.network(user.photoURL!, height: 100, width: 100),
//                           const SizedBox(height: 8),
//                           Text('Name: ${user.displayName ?? "No name"}'),
//                           const SizedBox(height: 4),
//                           Text('Email: ${user.email ?? "No email"}'),
//                         ],
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: const Text('Close'),
//                         ),
//                         TextButton(
//                           onPressed: () async {
//                             await _auth.signOut();
//                             await googleSignIn.signOut();
//                             Navigator.of(context).pop();
//                           },
//                           child: const Text('Sign out'),
//                         ),
//                       ],
//                     ),
//                   );
//                 } else {
//                   print('Login failed.');
//                 }
//               },
//               child: const Text('Sign in with Google',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
//             ),
//           ],
//         ),
//
//
//       ),
//
//     );
//   }
// }
//
//
