// import 'package:flutter/material.dart';
//
// import 'add_parents_data.dart';
// import 'grtchld_data.dart';
//
// class ParentsData extends StatefulWidget {
//   const ParentsData({super.key});
//
//   @override
//   State<ParentsData> createState() => _ParentsDataState();
// }
//
// class _ParentsDataState extends State<ParentsData> {
//   var data = FireServiceSharedPref();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         shape: CircleBorder(
//             side: BorderSide(
//           color: Color(0xff90873092),
//         )),
//         onPressed: () async {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AddParrentData(),
//             ),
//           );
//         },
//         child: const Text("Add"),
//       ),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff90873092),
//         centerTitle: true,
//         title: const Text(
//           "Parent Data",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: StreamBuilder(
//             stream: FireServiceSharedPref().getData(),
//             builder: (context, snapshot) {
//               var data = snapshot.data?.docs.toList();
//               return ListView.builder(
//                 itemCount: data?.length,
//                 itemBuilder: (context, index) {
//                   var parentData = data?[index].data();
//                   return InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => GrtchildData(
//                                 parentId: data![index].id,
//                               ),
//                             ));
//                       },
//                       child: Card(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("name:-${parentData?['name'] ?? ""}"),
//                             Text("email:-${parentData?['email'] ?? ""}"),
//                             Text("phone:-${parentData?['phone'] ?? ""}"),
//                             Text("gender:-${parentData?['gender'] ?? ""}"),
//                           ],
//                         ),
//                       ));
//                 },
//               );
//             }),
//       ),
//     );
//   }
// }
