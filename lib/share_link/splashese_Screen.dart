//
// import 'dart:async';
//
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:firebase_project/share_link/share_link_Screen.dart';
// import 'package:flutter/material.dart';
//
// class SplashesScreen extends StatefulWidget {
//   const SplashesScreen({super.key});
//
//   @override
//   State<SplashesScreen> createState() => _SplashesScreenState();
// }
//
// class _SplashesScreenState extends State<SplashesScreen> {
//   @override
//   void initState() {
//     super.initState();
//     getLink();
//     Timer(const Duration(seconds: 6), () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => ShareLinkScreen()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Welcome",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   void getLink() async {
//     final PendingDynamicLinkData? getDynamicLink = await FirebaseDynamicLinks.instance.getInitialLink();
//     if (getDynamicLink != null) {
//       final Uri deepLink = getDynamicLink.link;
//       Navigator.pushNamed(context, deepLink.path);
//     }
//
//
//
//     FirebaseDynamicLinks.instance.onLink.listen((PendingDynamicLinkData dynamicLinkData) {
//       final Uri deepLink = dynamicLinkData.link;
//       Navigator.pushNamed(context, deepLink.path);
//     }).onError((error) {
//       print('onLink error');
//       print(error.message);
//     });
//   }
// }
//
