import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: const Text("Videos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectVideoFile();
        },
        child: const Icon(
          Icons.add_circle,
          color: Colors.yellow,
        ),
      ),
      body: StreamBuilder(
        stream: getUploadedVideos(),
        builder: (context, snapshot) {
          var videos = snapshot.data?.docs;
          if (videos?.isNotEmpty == true) {
            return ListView.builder(
              itemCount: videos?.length,
              itemBuilder: (context, index) {
                return showVideoView(videos![index].data()['url']);
              },
            );
          } else {
            return const Center(
              child: Text("No video found!", style: TextStyle(color: Colors.white38),),
            );
          }
        },
      ),
    );
  }

  selectVideoFile() async {
    var result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.video);
    if (result != null) {
      var files = result.files.map((value) => File(value.path!)).toList();
      for (var singleFile in files) {
        uploadVideo(singleFile);
        print(singleFile.path);
      }
      print(files.first.path);
    }
  }

  uploadVideo(File file) {
    var storage = FirebaseStorage.instance;
    storage
        .ref("Videos")
        .child(file.path.split("/").last)
        .putFile(file)
        .then((value) async {
      var videoUrl = await value.ref.getDownloadURL();
      print(videoUrl);
      FirebaseFirestore.instance.collection("videos").add({"url": videoUrl});
      Fluttertoast.showToast(msg: "Video Uploaded");
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUploadedVideos() {
    var instance = FirebaseFirestore.instance.collection("videos");
    return instance.snapshots();
  }

  showVideoView(String videoPath) {
    return SizedBox(
      height: 480,
      child: VideoPlayerWidget(url: videoPath),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  const VideoPlayerWidget({required this.url, Key? key}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    )
        : Center(child: CircularProgressIndicator());
  }
}