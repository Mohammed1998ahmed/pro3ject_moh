import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
// import 'package:thi/localNotifation.dart';

class Notifactions extends StatefulWidget {
  const Notifactions({Key? key}) : super(key: key);

  @override
  _NotifactionsState createState() => _NotifactionsState();
}

class _NotifactionsState extends State<Notifactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              print("KKKKKKKKKKKKKK");
              // ignore: unused_element
              void sendNotification() async {
                // قم بإنشاء كائن للإشعار
                final content = NotificationContent(
                  id: 0,
                  channelKey: 'basic_channel',
                  title: 'عنوان الإشعار',
                  body: 'نص الإشعار',
                  payload: {'key': 'value'},
                );

                // أرسل الإشعار
                await AwesomeNotifications()
                    .createNotification(content: content);
              }

              // LocalNotifations.simpleLocalNotifation(
              //     title: "Add Club",
              //     body: " الحمد لله تعالى مشي حال الاشعارات",
              //     payload: "payload");
            },
            child: Text("data")),
      ),
    );
  }
}
