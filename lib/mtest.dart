import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  bool isImageExpanded = false;
  int selectedImageIndex = 0;

  List<String> imageUrls = [
    'assets/images/main/image 82.png',
    'assets/images/main/image 83.png',
    'assets/images/main/image 84.png',
    'assets/images/main/image 85.png',
    'assets/images/main/image 82.png',
  ];

  void _toggleImageSize() {
    setState(() {
      isImageExpanded = !isImageExpanded;
    });
  }

  Widget _buildImage(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImageIndex = index;
          _toggleImageSize();
        });
      },
      child: Image.asset(
        imageUrls[index],
        width: isImageExpanded ? 300 : 172,
        height: isImageExpanded ? 300 : 172,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('عارض الصور'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildImage(selectedImageIndex),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _toggleImageSize();
                });
              },
              child: Text(isImageExpanded ? 'تصغير' : 'توسيع'),
            ),
          ],
        ),
      ),
    );
  }
}
