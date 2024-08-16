// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Awesome Notifications Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _scheduleNotification();
//           },
//           child: Text('Send Notification'),
//         ),
//       ),
//     );
//   }

//   void _scheduleNotification() async {
//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: 1,
//         channelKey: 'basic_channel',
//         title: 'My Notification',
//         body: 'This is an awesome notification!',
//       ),
//       schedule: NotificationCalendar(
//           second: 5,

//          // تعديل هذه القيمة حسب الوقت المطلوب
//       ),
//     );
//   }
// }
// /////////////////////////
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome Notifications Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showLocalNotification();
          },
          child: Text('Show Notification'),
        ),
      ),
    );
  }

  void _showLocalNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'My Notification',
        body: 'This is an awesome notification!',
        // استبدل برابط الصورة الخاصة بك
        backgroundColor: Colors.red,
// assets/images/paralympic equestrian-amico.png
        bigPicture:
            'https://storage.googleapis.com/cms-storage-bucket/d406c736e7c4c57f5f61.png',
        largeIcon:
            'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
        notificationLayout: NotificationLayout.BigPicture,
      ),
    );
  }
}
