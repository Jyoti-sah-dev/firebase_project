// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:phone_auth_firebase/screen/home_page.dart';
//
// class RagistrationScreen extends StatefulWidget {
//   const RagistrationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RagistrationScreen> createState() => _RagistrationScreenState();
// }
//
// class _RagistrationScreenState extends State<RagistrationScreen> {
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigoAccent,
//         title: Center(child: Text("Registration Authentication",style: TextStyle(color: Colors.white,fontSize: 20),)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgMxIBAmMPLrGvXGPDKhOaqE-m61IYEXwJgUTS1JeMznvnzqd9DW7wywzKnvMeg_sD0o8&usqp=CAU"),
//             SizedBox(height: 40),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 hintText: "Email",
//                 icon: Icon(Icons.email,color: Colors.indigoAccent,),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                 hintText: "Password",
//                 icon: Icon(Icons.lock,color: Colors.indigoAccent,),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               // obscureText: true,
//             ),
//             SizedBox(height: 20),
//             MaterialButton(
//               color: Colors.indigoAccent,
//               onPressed: () {
//                 String email = emailController.text.trim();
//                 String password = passwordController.text.trim();
//                 if (email.isNotEmpty && password.isNotEmpty) {
//                   registration(email, password);
//                 } else {
//                   Fluttertoast.showToast(msg: "Please enter email and password");
//                 }
//               },
//               child: Text("Registration",style: TextStyle(color: Colors.white,fontSize: 18)),
//               // style: ElevatedButton.styleFrom(
//               // ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void registration(String email, String password) async {
//     try {
//       UserCredential userCredential =
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       if (userCredential.user != null) {
//         Fluttertoast.showToast(msg: "Registration successful");
//         Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage() ,));
//       } else {
//         Fluttertoast.showToast(msg: "Registration failed");
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error: $e");
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:phone_auth_firebase/screen/home_page.dart';
//
// class RagistrationScreen extends StatefulWidget {
//   const RagistrationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RagistrationScreen> createState() => _RagistrationScreenState();
// }
//
// class _RagistrationScreenState extends State<RagistrationScreen> {
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigoAccent,
//         title: Center(child: Text("Registration Authentication",style: TextStyle(color: Colors.white,fontSize: 20),)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgMxIBAmMPLrGvXGPDKhOaqE-m61IYEXwJgUTS1JeMznvnzqd9DW7wywzKnvMeg_sD0o8&usqp=CAU"),
//             SizedBox(height: 40),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 hintText: "Email",
//                 icon: Icon(Icons.email,color: Colors.indigoAccent,),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                 hintText: "Password",
//                 icon: Icon(Icons.lock,color: Colors.indigoAccent,),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               // obscureText: true,
//             ),
//             SizedBox(height: 20),
//             MaterialButton(
//               color: Colors.indigoAccent,
//               onPressed: () {
//                 String email = emailController.text.trim();
//                 String password = passwordController.text.trim();
//                 if (email.isNotEmpty && password.isNotEmpty) {
//                   registration(email, password);
//                 } else {
//                   Fluttertoast.showToast(msg: "Please enter email and password");
//                 }
//               },
//               child: Text("Registration",style: TextStyle(color: Colors.white,fontSize: 18)),
//               // style: ElevatedButton.styleFrom(
//               // ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void registration(String email, String password) async {
//     try {
//       UserCredential userCredential =
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       if (userCredential.user != null) {
//         Fluttertoast.showToast(msg: "Registration successful");
//         Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage() ,));
//       } else {
//         Fluttertoast.showToast(msg: "Registration failed");
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error: $e");
//     }
//   }
// }















import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'mycurrent_loaction.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Key for form validation

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _storeCurrentLocation(String userId) async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      // Request location permission
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission is denied');
      } else if (permission == LocationPermission.deniedForever) {
        throw Exception('Location permission is permanently denied');
      }

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get the placemark
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks.first;

      // Store the location data in Firestore
      await _firestore.collection('users').doc(userId).collection('locations').add({
        'latitude': position.latitude,
        'longitude': position.longitude,
        'address': place.street,
        'locality': place.locality,
        'subAdministrativeArea': place.subAdministrativeArea,
        'administrativeArea': place.administrativeArea,
        'postalCode': place.postalCode,
        'country': place.country,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error storing location: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error storing location: ${e.toString()}')),
      );
    }
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        await _storeCurrentLocation(userCredential.user!.uid);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LocationScreen(userId: userCredential.user!.uid),
          ),
              (route) => false, // This will remove all previous routes from the stack
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('R E G I S T R A T I O N ', style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(56.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFnq5x7f8kxk7WiwrHwIC79tiQWFPkEPqKRKb36mnvb4gJvBpoHcMjJ3k9xCtmGsjaxPs&usqp=CAU"),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        prefixIcon: const Icon(Icons.email, color: Colors.purple),
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        prefixIcon: const Icon(Icons.lock, color: Colors.purple),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      color: Colors.purple,
                      onPressed: _register,
                      child: const Text('Sign_In', style: TextStyle(fontSize: 16,color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            ),
        );
    }
}