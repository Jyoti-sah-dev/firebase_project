// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'mixxin_class.dart';
//
// class AddParrentData extends StatefulWidget  {
//   const AddParrentData({super.key});
//
//   @override
//   State<AddParrentData> createState() => _AddParrentDataState();
// }
//
// class _AddParrentDataState extends State<AddParrentData>with CustumWidgets {
//
//   @override
//
//   Widget build(BuildContext context) {
//     var nameController=TextEditingController();
//     var emailController=TextEditingController();
//     var phoneController=TextEditingController();
//     var genderController=TextEditingController();
//    var Data = FireServiceSharedPref();
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color(0xff90873092),
//         title: Text("AddprentData",style: TextStyle(color: Colors.white),),
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
//             height:10,
//           ),
//           viewbutton("Add parent", onPressed: (){
//
//             Data.parentData(
//                 nameController.text,
//                 emailController.text,
//                 int.parse(
//                   phoneController.text,),
//                 genderController.text);
//             Navigator.pop(context);
//           }),
//         ],
//
//       ),
//     );
//   }
// }