


import 'package:firebase_project/First_interview_project_Api/splash1_screen.dart';
import 'package:firebase_project/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   print("Handling a background message: ${message.messageId}");
// }
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splash1Screen(),
    );
  }
}







// import 'package:firebase_project/rasturentUserData/add_resturent_page.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'authcurrent_Lucation/show_login_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   ThemeMode _themeMode = ThemeMode.light;
//
//   void _toggleTheme() {
//     setState(() {
//       _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData.light(),
//         darkTheme: ThemeData.dark(),
//         themeMode: _themeMode,
//         home:  AddRestaurantPage(),
//         );
//     }
// }
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'Secend_interview_project_Api/new_api_service.dart';
// import 'Secend_interview_project_Api/search_screen.dart';
//
//
// void main() async {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (context) => NewsProvider(),
//         child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'New',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             home: NewsSearchView(),
//             ),
//      );
//     }
// // }
// import 'package:firebase_project/First_interview_project_Api/splash1_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'Secend_interview_project_Api/provider_class.dart';
//
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => NewsProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:  Splash1Screen(),
//     );
//   }
// }
