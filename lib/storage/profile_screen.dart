// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   XFile? imageFile;
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   getData() async {
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       var snapshot = await FirebaseFirestore.instance.collection("users").get();
//       if (snapshot.docs.isNotEmpty) {
//         var userData = snapshot.docs.first.data();
//         setState(() {
//           nameController.text = userData['name'];
//           emailController.text = userData['email'];
//           phoneController.text = userData['phone'];
//           // Assuming imageUrl is stored in Firebase Storage and retrieved separately
//           // You may need to adjust this part based on your storage structure
//           imageUrl = userData['imageUrl'] ?? "";
//         });
//       }
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error fetching data: $e");
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text("PROFILE")),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: takeImage,
//                 child: CircleAvatar(
//                   radius: 60,
//                   backgroundColor: Colors.pinkAccent,
//                   backgroundImage:
//                   imageFile == null ? null : FileImage(File(imageFile?.path ?? "")),
//                   child: imageFile == null
//                       ? const Icon(Icons.photo_camera_back_outlined, size: 50, color: Colors.white)
//                       : null,
//                 ),
//               ),
//               const SizedBox(height: 20,),
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(labelText: "Name"),
//               ),
//               const SizedBox(height: 20,),
//               TextField(
//                 controller: emailController,
//                 decoration: const InputDecoration(labelText: "Email"),
//               ),
//               const SizedBox(height: 20,),
//               TextField(
//                 controller: phoneController,
//                 decoration: const InputDecoration(labelText: "Phone"),
//               ),
//               const SizedBox(height: 20,),
//               ElevatedButton(
//                 onPressed: uploadImage,
//                 child: const Text("Submit"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   takeImage() async {
//     try {
//       var imagePicker = ImagePicker();
//       var image = await imagePicker.pickImage(source: ImageSource.gallery);
//       setState(() {
//         imageFile = image!;
//       });
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error picking image: $e");
//     }
//   }
//
//   var imageUrl = "";
//
//   uploadImage() async {
//     if (imageFile == null ||
//         nameController.text.isEmpty ||
//         emailController.text.isEmpty ||
//         phoneController.text.isEmpty) {
//       Fluttertoast.showToast(msg: "Please complete all fields and upload images");
//       return;
//     }
//
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       var storage = FirebaseStorage.instance;
//       var storageRef = storage.ref("image").child(imageFile?.name ?? "");
//       var uploadTask = storageRef.putFile(File(imageFile!.path));
//       await uploadTask.whenComplete(() async {
//         imageUrl = await storageRef.getDownloadURL();
//       });
//
//       var firestore = FirebaseFirestore.instance;
//       await firestore.collection("users").add({
//         "name": nameController.text,
//         "email": emailController.text,
//         "phone": phoneController.text,
//         "imageUrl": imageUrl
//       });
//
//       Fluttertoast.showToast(msg: "Data uploaded successfully");
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Error uploading data: $e");
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
// }


import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? imageFile;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  String? uploadedImageUrl;
  String? uploadedName;
  String? uploadedEmail;
  String? uploadedPhone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: takeImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue,
                  backgroundImage: imageFile == null
                      ? null
                      : FileImage(File(imageFile!.path)),
                  child: imageFile == null
                      ? const Icon(Icons.camera_alt,
                      size: 50, color: Colors.white)
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Phone"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: uploadData,
                child: const Text("Submit"),
              ),
              const SizedBox(height: 20),
              if (uploadedImageUrl != null) ...[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(uploadedImageUrl!),
                ),
                const SizedBox(height: 20),
                Text('Name: $uploadedName'),
                Text('Email: $uploadedEmail'),
                Text('Phone: $uploadedPhone'),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> takeImage() async {
    try {
      var imagePicker = ImagePicker();
      var image = await imagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        imageFile = image;
      });
    } catch (e) {
      Fluttertoast.showToast(msg: "Error picking image: $e");
    }
  }

  Future<void> uploadData() async {
    if (imageFile == null || nameController.text.isEmpty || emailController.text.isEmpty || phoneController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please complete all fields and upload an image");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      // Upload image to Firebase Storage
      var storage = FirebaseStorage.instance;
      var storageRef = storage.ref("Images").child(imageFile?.name??"");
      var uploadTask = storageRef.putFile(File(imageFile!.path));
      await uploadTask;
      String imageUrl = await storageRef.getDownloadURL();

      // Store data in Firestore
      var firestore = FirebaseFirestore.instance;
      await firestore.collection("users").add({
        "name": nameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
        "imageUrl": imageUrl,

      });

      // Update state to display uploaded data
      setState(() {
        uploadedImageUrl = imageUrl;
        uploadedName = nameController.text;
        uploadedEmail = emailController.text;
        uploadedPhone = phoneController.text;
      });

      Fluttertoast.showToast(msg: "Data uploaded successfully");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error uploading data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}