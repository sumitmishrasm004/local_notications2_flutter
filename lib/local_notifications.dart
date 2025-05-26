// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:local_notications2/main.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:timezone/timezone.dart' as tz;

// import 'package:permission_handler/permission_handler.dart';

// Future<void> scheduleNotification(DateTime selectedDateTime) async {
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'your channel id',
//     'your channel name',
//      channelDescription: 'your channel description',
//     importance: Importance.max,
//     priority: Priority.high,
//     showWhen: false,
//   );

//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);

//   await flutterLocalNotificationsPlugin.zonedSchedule(
//     0,
//     'Scheduled Notification Title',
//     'Scheduled Notification Body',
//     tz.TZDateTime.from(selectedDateTime, tz.local).add(
//       const Duration(seconds: 10),
//     ),
//     platformChannelSpecifics,
//     // uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
//     androidAllowWhileIdle: true,
//     payload: 'Custom_Sound',
//     uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//   );
// }



// Future<void> requestPermissions() async {
//   final status = await Permission.notification.request();
//   if (status.isGranted) {
//     // You have permission to schedule notifications.
//   } else {
//     // Permission denied. Handle accordingly.
//   }
// }
