// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class PDFScreen extends StatefulWidget {
//   const PDFScreen({super.key});
//
//   @override
//   State<PDFScreen> createState() => _PDFScreenState();
// }
//
// class _PDFScreenState extends State<PDFScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black45,
//       appBar: AppBar(
//         backgroundColor: Colors.black12,
//         title: const Text("PDF"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           selectpdfFile();
//         },
//         child: const Icon(
//           Icons.add_circle,
//           color: Colors.yellow,
//         ),
//       ),
//       body: StreamBuilder(
//         stream: getUploadPdfs(),
//         builder: (context, snapshot) {
//           var pdfs = snapshot.data?.docs;
//           if (pdfs?.isNotEmpty == true) {
//             return ListView.builder(
//               itemCount: pdfs?.length,
//               itemBuilder: (context, index) {
//                 return showPdfView(pdfs![index].data()['url']);
//               },
//             );
//           } else {
//             return const Center(
//               child: Text("No pdf found!",style: TextStyle(color: Colors.white38),),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   selectpdfFile() async {
//     var result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['PDF', 'video', 'image']);
//     if (result != null) {
//       var files = result.files.map((value) => File(value.path!)).toList();
//       for (var singleFile in files) {
//         uploadPdf(singleFile);
//         print(singleFile.path);
//       }
//       print(files.first.path);
//     }
//   }
//
//   uploadPdf(File file) {
//     var storage = FirebaseStorage.instance;
//     storage
//         .ref("PDFs")
//         .child(file.path.split(".").last)
//         .putFile(file)
//         .then((value) async {
//       var pdfUrl = await value.ref.getDownloadURL();
//       print(pdfUrl);
//       FirebaseFirestore.instance.collection("pdfs").add({"url": pdfUrl});
//       Fluttertoast.showToast(msg: "Pdf Upload");
//     });
//   }
//
//   Stream<QuerySnapshot<Map<String, dynamic>>> getUploadPdfs() {
//     var instance = FirebaseFirestore.instance.collection("pdfs");
//     return instance.snapshots();
//   }
//
//   showPdfView(String pdfPath) {
//     return SizedBox(
//       height: 480,
//       child: SfPdfViewer.network(pdfPath),
//     );
//   }
// }