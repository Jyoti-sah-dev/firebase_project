import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadedScreen extends StatefulWidget {
  const UploadedScreen({super.key});

  @override
  State<UploadedScreen> createState() => _UploadedScreenState();
}

class _UploadedScreenState extends State<UploadedScreen> {
  List<File> multiFiles = <File>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uploaded File"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            takeFile();
          }, child: Text("take file"))
        ],
      ),
    );
  }

  takeFile()async{
    var fileResult = await FilePicker.platform.pickFiles(allowMultiple: true);
    if(fileResult != null){
      var files = fileResult.files.map((path) => File(path.path!)).toList();
      for(var singleFile in files){
        var img = singleFile.path.split(".").last;
        if(img == "jbg" || img == "png"){
          //add image list
        }if(img == "mp4" || img == "mkv"){
          // add in video list
        }
        multiFiles.add(singleFile);
        // upload image singlefile
      }
      setState(() {

      });
    }
  }

  uploadImage(File file){
    var storage = FirebaseStorage.instance;
    storage.ref("images").child(file.path.split("/").last).
    putFile(file).then((p0) async{
      var imageUrl = await p0.ref.getDownloadURL();
      print(imageUrl);
    });
  }
}