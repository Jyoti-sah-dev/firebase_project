// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:phone_auth_firebase/googlemap/ragistration_screen.dart';
//
// import 'LocationScreen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//          backgroundColor: Colors.lightBlue,
//          title: Center(child: Text('Login Authenitication')),
//          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.dark_mode,color: Colors.black,))],
//        ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNyOB6khUNzw_liwDUXRJvYXcKC2mwmcQjOkZ8fTXwLJutkfwG6nCJR__Yh5dUytBQ5xE&usqp=CAU"),
//                    SizedBox(height: 30),
//                 TextField(
//                   controller: _emailController,
//                   decoration:  InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15)
//                       ),
//                       prefixIcon: const Icon(Icons.email,color: Colors.lightBlue,),
//                       labelText: 'Email'
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 const SizedBox(height: 25),
//                 TextField(
//                   controller: _passwordController,
//                   decoration:  InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15)
//                       ),
//                       prefixIcon: const Icon(Icons.lock,color: Colors.lightBlue,),
//                       labelText: 'Password'
//                   ),
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _login,
//                   child: const Text('Login'),
//                 ),
//                 TextButton(
//                   onPressed: _navigateToRegistration,
//                   child: const Text('Register'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _login() async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//       await _storeCurrentLocation(userCredential.user!.uid);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LocationScreen(userId: userCredential.user!.uid)),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }
//
//   Future<void> _navigateToRegistration() async {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => RegistrationScreen()),
//     );
//   }
//
//   Future<void> _storeCurrentLocation(String userId) async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//     Placemark place = placemarks.first;
//
//     await _firestore.collection('users').doc(userId).collection('locations').add({
//     'latitude': position.latitude,
//     'longitude': position.longitude,
//     'address': place.street,
//     'locality': place.locality,
//     'subAdministrativeArea': place.subAdministrativeArea,
//     'administrativeArea': place.administrativeArea,
//     'postalCode': place.postalCode,
//     'country': place.country,
//     'timestamp': FieldValue.serverTimestamp(),
//     });
//   }
// }
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:phone_auth_firebase/googlemap/ragistration_screen.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'LocationScreen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   bool isDarkMode = false;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   void _toggleTheme() {
//     setState(() {
//       isDarkMode = !isDarkMode;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlue,
//         title: Center(child: Text('Login Authentication')),
//         actions: [
//           IconButton(
//             onPressed: _toggleTheme,
//             icon: Icon(
//               isDarkMode ? Icons.light_mode : Icons.dark_mode,
//               color: Colors.black,
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child:
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNyOB6khUNzw_liwDUXRJvYXcKC2mwmcQjOkZ8fTXwLJutkfwG6nCJR__Yh5dUytBQ5xE&usqp=CAU"),
//                 SizedBox(height: 30),
//                 TextField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     prefixIcon: const Icon(Icons.email, color: Colors.lightBlue),
//                     labelText: 'Email',
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 const SizedBox(height: 25),
//                 TextField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     prefixIcon: const Icon(Icons.lock, color: Colors.lightBlue),
//                     labelText: 'Password',
//                   ),
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _login,
//                   child: const Text('Login'),
//                 ),
//                 TextButton(
//                   onPressed: _navigateToRegistration,
//                   child: const Text('Register'),
//                 ),
//               ],
//             ),
//           ),
//       ),
//     );
//   }
//
//   Future<void> _login() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//
//     if (email.isEmpty || password.isEmpty) {
//       Fluttertoast.showToast(
//         msg: "Please enter email and password",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//       );
//       return;
//     }
//
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       await _storeCurrentLocation(userCredential.user!.uid);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LocationScreen(userId: userCredential.user!.uid)),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }
//
//   Future<void> _navigateToRegistration() async {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => RegistrationScreen()),
//     );
//   }
//
//   Future<void> _storeCurrentLocation(String userId) async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//     Placemark place = placemarks.first;
//
//     await _firestore.collection('users').doc(userId).collection('locations').add({
//       'latitude': position.latitude,
//       'longitude': position.longitude,
//       'address': place.street,
//       'locality': place.locality,
//       'subAdministrativeArea': place.subAdministrativeArea,
//       'administrativeArea': place.administrativeArea,
//       'postalCode': place.postalCode,
//       'country': place.country,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }
// }
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:phone_auth_firebase/googlemap/ragistration_screen.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'LocationScreen.dart';
//
// class LoginScreen extends StatefulWidget {
//   final Function toggleTheme;
//   final bool isDarkMode;
//
//   const LoginScreen({super.key, required this.toggleTheme, required this.isDarkMode});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlue,
//         title: Center(child: Text('Login Authentication')),
//         actions: [
//           IconButton(
//             onPressed: widget.toggleTheme,
//             icon: Icon(
//               widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
//               color: Colors.black,
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNyOB6khUNzw_liwDUXRJvYXcKC2mwmcQjOkZ8fTXwLJutkfwG6nCJR__Yh5dUytBQ5xE&usqp=CAU"),
//               SizedBox(height: 30),
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   prefixIcon: const Icon(Icons.email, color: Colors.lightBlue),
//                   labelText: 'Email',
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               const SizedBox(height: 25),
//               TextField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   prefixIcon: const Icon(Icons.lock, color: Colors.lightBlue),
//                   labelText: 'Password',
//                 ),
//                 obscureText: true,
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: const Text('Login'),
//               ),
//               TextButton(
//                 onPressed: _navigateToRegistration,
//                 child: const Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _login() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//
//     if (email.isEmpty || password.isEmpty) {
//       Fluttertoast.showToast(
//         msg: "Please enter email and password",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//       );
//       return;
//     }
//
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       await _storeCurrentLocation(userCredential.user!.uid);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LocationScreen(userId: userCredential.user!.uid)),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }
//
//   Future<void> _navigateToRegistration() async {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => RegistrationScreen()),
//     );
//   }
//
//   Future<void> _storeCurrentLocation(String userId) async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//     Placemark place = placemarks.first;
//
//     await _firestore.collection('users').doc(userId).collection('locations').add({
//       'latitude': position.latitude,
//       'longitude': position.longitude,
//       'address': place.street,
//       'locality': place.locality,
//       'subAdministrativeArea': place.subAdministrativeArea,
//       'administrativeArea': place.administrativeArea,
//       'postalCode': place.postalCode,
//       'country': place.country,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }
// }
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:phone_auth_firebase/googlemap/ragistration_screen.dart';
// import 'LocationScreen.dart';
//
// class LoginScreenView extends StatefulWidget {
//   final Function toggleTheme;
//   final bool isDarkMode;
//
//   const LoginScreenView({super.key, required this.toggleTheme, required this.isDarkMode});
//
//   @override
//   _LoginScreenViewState createState() => _LoginScreenViewState();
// }
//
// class _LoginScreenViewState extends State<LoginScreenView> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlue,
//         title: Center(child: Text('USER LOGIN')),
//         actions: [
//           IconButton(
//             onPressed: () => widget.toggleTheme(),
//             icon: Icon(
//               widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
//               color: Colors.black,
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNyOB6khUNzw_liwDUXRJvYXcKC2mwmcQjOkZ8fTXwLJutkfwG6nCJR__Yh5dUytBQ5xE&usqp=CAU"),
//               SizedBox(height: 30),
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   prefixIcon: const Icon(Icons.email, color: Colors.lightBlue),
//                   labelText: 'Email',
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               const SizedBox(height: 25),
//               TextField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   prefixIcon: const Icon(Icons.lock, color: Colors.lightBlue),
//                   labelText: 'Password',
//                 ),
//                 obscureText: true,
//               ),
//                SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   TextButton(
//                     onPressed: _login,
//                     child: const Text('Login',style: TextStyle(color: Colors.lightBlue,fontSize: 20),),
//                   ),
//                   TextButton(
//                     onPressed: _navigateToRegistration,
//                     child: const Text('Register',style: TextStyle(color: Colors.lightBlue,fontSize: 20),)
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _login() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//     if (email.isEmpty || password.isEmpty) {
//       Fluttertoast.showToast(
//         msg: "Please enter email and password",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//       );
//       return;
//     }
//
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       await _storeCurrentLocation(userCredential.user!.uid);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => LocationScreen(userId: userCredential.user!.uid)),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }
//
//   Future<void> _navigateToRegistration() async {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => RegistrationScreen()),
//     );
//   }
//
//   Future<void> _storeCurrentLocation(String userId) async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     List<Placemark> placemarks = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//     Placemark place = placemarks.first;
//
//     await _firestore.collection('users').doc(userId).collection('locations').add({
//       'latitude': position.latitude,
//       'longitude': position.longitude,
//       'address': place.street,
//       'locality': place.locality,
//       'subAdministrativeArea': place.subAdministrativeArea,
//       'administrativeArea': place.administrativeArea,
//       'postalCode': place.postalCode,
//       'country': place.country,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/authcurrent_Lucation/show_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'mycurrent_loaction.dart';

class LoginScreenView extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;
  const LoginScreenView(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  _LoginScreenViewState createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      //  backgroundColor: Color (0xff2A0934F9),
        backgroundColor: Colors.deepPurple,
        title: const Center(
            child: Text(' L O G I N F O R M',
                style: TextStyle(color: Colors.white))),
        actions: [
          IconButton(
            onPressed: () => widget.toggleTheme(),
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7wDemmyTK731Uq626xS-tWrGpw6h-I6RWeA&s"),
                    const SizedBox(height: 30),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.deepPurple),
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 25),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon:
                            const Icon(Icons.lock, color: Colors.deepPurple),
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox( height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        TextButton(

                          onPressed: _login,
                          child: const Text('Login',
                              style: TextStyle(
                                  color: Colors.deepPurple, fontSize: 20)),
                        ),
                        TextButton(
                          onPressed: _navigateToRegistration,
                          child: const Text('Register',
                              style: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 20)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: "Please enter email and password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _storeCurrentLocation(userCredential.user!.uid);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LocationScreen(userId: userCredential.user!.uid)),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      } else {
        errorMessage = 'Error: ${e.message}';
      }
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _navigateToRegistration() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrationScreen()),
    );
  }

  Future<void> _storeCurrentLocation(String userId) async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    Placemark place = placemarks.first;

    await _firestore
        .collection('users')
        .doc(userId)
        .collection('locations')
        .add({
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
  }
}
