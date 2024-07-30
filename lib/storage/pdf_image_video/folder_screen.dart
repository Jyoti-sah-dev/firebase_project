// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_project/storage/pdf_image_video/pdf_Screen.dart';
// import 'package:firebase_project/storage/pdf_image_video/video_Screen.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'image_screen.dart';
//
// class FolderScreen extends StatefulWidget {
//   const FolderScreen({super.key});
//
//   @override
//   State<FolderScreen> createState() => _FolderScreenState();
// }
//
// class _FolderScreenState extends State<FolderScreen> {
//   var folders = <Map>[];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black45,
//       appBar: AppBar(
//         backgroundColor: Colors.black45,
//         title: const Center(
//             child: Text("Files",)),
//         actions: [
//           IconButton(onPressed: (){
//           }, icon: const Icon(Icons.menu)),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           createNewFolderDialog();
//         },
//         child: const Icon(
//           Icons.add_circle_outline,
//           color: Colors.yellow,
//         ),
//       ),
//       body: StreamBuilder(
//         stream: getFolders(),
//         builder: (context, snapshot) {
//           var folders = snapshot.data?.docs;
//           if (snapshot.hasData) {
//             return folders!.isNotEmpty
//                 ? ListView.separated(
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     onTap: () {
//                       gotoNextScreenBasedOnType(folders[index]['type']);
//                     },
//                     leading: const Icon(
//                       Icons.folder,
//                       color: Colors.yellow,
//                     ),
//                     title: Text(folders[index]['name'],style: const TextStyle(color: Colors.cyan),),
//                     subtitle: Text(folders[index]['type'],style: const TextStyle(color: Colors.white70),),
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return const Divider(
//                     color: Colors.white38,
//                   );
//                 },
//                 itemCount: folders.length)
//                 : const Center(
//               child: Text(" No Folders"),
//             );
//
//           } else if (snapshot.hasError) {
//             return const Center(
//               child: Text("Error loading folders"),
//             );
//           }
//           else {
//             return  Center(
//               child: Text("Not Found Folders"),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   var folderTypes = ['image', 'video', 'PDF'];
//   var selectedType = '';
//   TextEditingController folderNameController = TextEditingController();
//
//   createNewFolderDialog() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             shadowColor: Colors.tealAccent,
//             elevation: 5,
//             title: const Text("Create new folder"),
//
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 DropdownButtonFormField(
//                     items: folderTypes
//                         .map((type) => DropdownMenuItem(value: type,child: Text(type),))
//                         .toList(),
//                     onChanged: (type) {
//                       selectedType = type ?? "";
//                       setState(() {});
//                     }),
//                 const SizedBox(
//                   height: 18,
//                 ),
//                 TextField(
//                   controller: folderNameController,
//                 ),
//               ],
//             ),
//             actions: [
//               ElevatedButton(
//                   onPressed: () {
//                     addFolder();
//                     folderNameController.clear();
//                     selectedType = '';
//
//                     setState(() {
//                       Navigator.pop(context);
//                     });
//                   },
//                   child: const Text("Add")),
//               ElevatedButton(onPressed: () {}, child: const Text("Cancel")),
//             ],
//           );
//         });
//   }
//
//   gotoNextScreenBasedOnType(String type) {
//     if (type == folderTypes[0]) {
//       gotoImageScreen(ImageScreen());
//     } else if (type == folderTypes[1]) {
//       gotoVideo(VideoScreen());
//     } else {
//       gotoNext(const PDFScreen());
//     }
//   }
//
//   gotoImageScreen(Widget pages) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => pages));
//   }
//
//   gotoVideo(Widget pages) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => pages));
//   }
//
//
//   gotoNext(Widget page) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => page));
//   }
//
//   addFolder() async {
//     await FirebaseFirestore.instance.collection("folders").add({
//       "name": folderNameController.text,
//       "type": selectedType,
//     }).then((value) {
//       Fluttertoast.showToast(msg: "Folder Create");
//     });
//   }
//
//   Stream<QuerySnapshot<Map<String, dynamic>>> getFolders() {
//     return FirebaseFirestore.instance.collection("folders").snapshots();
//   }
// }