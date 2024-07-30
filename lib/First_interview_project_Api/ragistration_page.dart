// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'home_api_screen.dart';
// import 'login_page.dart';
//
// class RegisterScreen extends StatefulWidget {
//
//   RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> registerUser(BuildContext context) async {
//     try {
//       String email = emailController.text.trim();
//       String password = passwordController.text.trim();
//
//     await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       // Save registration status using SharedPreferences
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setBool('isRegistered', true);
//
//       // Navigate to home screen on successful registration
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const EshopHomeScreen()),
//       );
//     } catch (e) {
//       // Show Flutter toast for registration failure
//       Fluttertoast.showToast(
//         msg: "Registration failed. Please try again.",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Card(
//           color: Colors.blueGrey.shade50,
//           child: ListView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 30,left: 20),
//                 child: Text(
//                   'e-Shop',
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue.shade900),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 128,right: 10,left: 10),
//                 child: TextField(
//                   controller: nameController,
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(borderSide: BorderSide.none),
//                       labelText: 'Name',
//                       filled: true,
//                       fillColor: Colors.white
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
//                 child: TextField(
//                   controller: emailController,
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(borderSide: BorderSide.none),
//                       labelText: 'Email',
//                       filled: true,
//                       fillColor: Colors.white
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
//                 child: TextField(
//                   controller: passwordController,
//                   decoration: const InputDecoration(
//                       border: OutlineInputBorder(borderSide: BorderSide.none),
//                       hintText: 'Password',
//                       filled: true,
//                       fillColor: Colors.white
//                   ),
//                   maxLength: 8,
//                 ),
//               ),
//               SizedBox(height: 120),
//               // Existing UI code for text fields and button
//               Center(
//                 child: MaterialButton(
//                   color: Colors.blue.shade700,
//                   onPressed: () => registerUser(context),
//                   child: const Text(
//                     'Register',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: TextButton(
//                   onPressed: (){
//                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ShopLoginScreen(),),(route) => false,);
//                   },
//                   child: Center(
//                     child: RichText(
//                       text: const TextSpan(
//                           text: 'Already have an account?',
//                           style: TextStyle(color: Colors.black54),
//                           children: <TextSpan>[
//                             TextSpan(
//                                 text: 'Login',
//                                 style: TextStyle(color: Colors.lightBlue)
//                             )
//                           ]
//                       ),),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_api_screen.dart';
import 'login_page.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with ViewTextFild {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "e-Shop",
                style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(height: 100),
            viewTextFild("Name", _nameController),
            viewTextFild("Email", _emailController),
            viewTextFild("Password", _passwordController),
            const SizedBox(height: 150),
            viewButton(
              "Sign Up",
              onPressed: () {
                String name = _nameController.text.trim();
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                if (name.isEmpty || email.isEmpty || password.isEmpty) {
                  Fluttertoast.showToast(
                    msg: "Please fill all fields",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.red,
                    fontSize: 16.0,
                  );
                } else if (password.length < 8) {
                  Fluttertoast.showToast(
                    msg: "Password must be at least 8 characters long",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.white,
                    textColor: Colors.red,
                    fontSize: 16.0,
                  );
                } else {
                  registerUser(name, email, password);
                }
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? ", style: TextStyle(color: Colors.black)),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EshopLogin()));
                  },
                  child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerUser(String name, String email, String password) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      var userData = await _firestore.collection("usersauth").where("usersEmail", isEqualTo: email).get();
      if (userData.docs.isNotEmpty) {
        Fluttertoast.showToast(
          msg: "Already exists",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.red,
          fontSize: 16.0,
        );
      } else {
        await _firestore.collection("usersauth").add({
          "usersName": name,
          "usersEmail": email,
          "usersPassword": password,
        });
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Demo()));
      }
    } catch (e) {
      print("Error registering user: $e");
      Fluttertoast.showToast(
        msg: "Error registering user",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}

mixin ViewTextFild {
  Widget viewTextFild(String name, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SizedBox(
            width: 330,
            height: 38,
            child: TextField(
              controller: controller,
              obscureText: name == "Password", // Hide text for password
              decoration: InputDecoration(
                hintText: name,
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget viewButton(String name, {required void Function()? onPressed}) {
    return MaterialButton(
        height: 40,
        minWidth: 200,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.indigo),
        ),
        color: Colors.indigo,
        onPressed: onPressed,
        child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        );
    }
}
