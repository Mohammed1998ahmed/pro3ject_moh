// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:video_player/video_player.dart';

// class VideoPickerScreen extends StatefulWidget {
//   @override
//   _VideoPickerScreenState createState() => _VideoPickerScreenState();
// }

// class _VideoPickerScreenState extends State<VideoPickerScreen> {
//   VideoPlayerController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network('');
//   }

//   Future<void> _selectVideo() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['mp4', 'avi'], // الامتدادات المسموح بها
//       allowMultiple: false,
//     );

//     if (result != null && result.files.isNotEmpty) {
//       PlatformFile file = result.files.first;
//       String path = file.path!;
//       _controller = VideoPlayerController.file(File(path));
//       await _controller!.initialize();
//       _isVideoPlaying = true;
//       _isVideoSelected = true;

//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }

//   bool _isVideoPlaying = false;
//   bool _isVideoSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Picker Example'),
//       ),
//       body: Center(
//         child: _isVideoSelected
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height * 0.7,
//                     child: AspectRatio(
//                       aspectRatio: _controller!.value.aspectRatio,
//                       child: VideoPlayer(_controller!),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       _isVideoPlaying ? Icons.pause : Icons.play_arrow,
//                       size: 48.0,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isVideoPlaying = !_isVideoPlaying;
//                         _isVideoPlaying
//                             ? _controller!.play()
//                             : _controller!.pause();
//                       });
//                     },
//                   ),
//                 ],
//               )
//             : Text('No video selected'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _selectVideo,
//         child: Icon(Icons.folder),
//       ),
//     );
//   }
// }
