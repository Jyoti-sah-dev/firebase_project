//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:phone_authentication/firestore_auth/firestores_login_screen.dart';
//
// import 'mixxin_class.dart';
//
//
//
// class AddchildData extends StatefulWidget  {
//   final parentId;
//   const AddchildData({super.key,this.parentId});
//
//   @override
//   State<AddchildData> createState() => _AddchildDataState();
// }
//
// class _AddchildDataState extends State<AddchildData>with CustumWidgets {
//
//   @override
//
//   Widget build(BuildContext context) {
//     var nameController=TextEditingController();
//     var emailController=TextEditingController();
//     var phoneController=TextEditingController();
//     var genderController=TextEditingController();
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color(0xff90873092),
//         title: Text("AddChildtData",style: TextStyle(color: Colors.white),),
//       ),
//       body: Column(
//
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           viewTextFild("name",nameController,Icons.person),
//           viewTextFild("email", emailController,Icons.email),
//           viewTextFild("phone", phoneController,Icons.phone),
//           viewTextFild("gender", genderController,Icons.generating_tokens),
//           SizedBox(
//             height: 10,
//           ),
//           viewbutton("Add child", onPressed: ()async{
//             await FirestoreLoginScreen().hashCode;
//             Navigator.pop(context);
//           })
//         ],
//
//       ),
//     );
//   }
// //
// //   viewbutton(String s, {required Future<Null> Function() onPressed}) {}
// // }
// //
// // class FireServiceSharedPref {
// //   childtData(String text, String text2, int parse, String text3, parentId) {}
//  }