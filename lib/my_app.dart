// import 'package:flutter/material.dart';
// import 'package:local_notications2/local_notifications.dart';
// import 'package:table_calendar/table_calendar.dart';

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     DateTime _selectedDateTime = DateTime.now();

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Local Notifications Example'),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               TableCalendar(
//                 focusedDay: _selectedDateTime,
//                 firstDay: DateTime(2000),
//                 lastDay: DateTime(2101),
//                 calendarFormat: CalendarFormat.month,
//                 onDaySelected: (selectedDay, focusedDay) {
//                   scheduleNotification(
//                     selectedDay,
//                   );
//                   setState(() {
//                     _selectedDateTime = selectedDay;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tzdata;


// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: NotificationScreen(),
//     );
//   }
// }

// class NotificationScreen extends StatefulWidget {
//   @override
//   _NotificationScreenState createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   DateTime _selectedDateTime = DateTime.now();

//   @override
//   void initState() {
//     super.initState();
//     initializeTimeZones();
//     initializeNotifications();
//   }

//   Future<void> initializeTimeZones() async {
//     tzdata.registerTimeZone();
//     final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(timeZoneName));
//   }

//   Future<void> initializeNotifications() async {
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');

//     final IOSInitializationSettings initializationSettingsIOS =
//         IOSInitializationSettings(
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );

//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> scheduleNotification(tz.TZDateTime scheduledDateTime) async {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     final int difference = scheduledDateTime.isBefore(now)
//         ? now.isBefore(scheduledDateTime)
//             ? scheduledDateTime.millisecondsSinceEpoch - now.millisecondsSinceEpoch
//             : scheduledDateTime
//                 .add(const Duration(days: 1))
//                 .millisecondsSinceEpoch - now.millisecondsSinceEpoch
//         : scheduledDateTime.millisecondsSinceEpoch - now.millisecondsSinceEpoch;

//     if (difference < 0) {
//       // The selected date and time is in the past; don't schedule a notification.
//       return;
//     }

//     final AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );

//     final NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0, // Use a unique ID for each notification
//       'Scheduled Notification',
//       'This is your scheduled notification',
//       scheduledDateTime,
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       payload: 'custom_payload',
//       androidAllowWhileIdle: true,
//     );
//   }

//   Future<void> onDidReceiveLocalNotification(
//     int id,
//     String? title,
//     String? body,
//     String? payload,
//   ) async {
//     // Handle what happens when a notification is received while the app is in the foreground
//     if (payload == 'custom_payload') {
//       // Handle the specific payload you set
//       print('Custom notification payload received');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Local Notifications Example'),
//       ),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             TableCalendar(
//               focusedDay: _selectedDateTime,
//               firstDay: tz.TZDateTime(tz.local, 2000),
//               lastDay: tz.TZDateTime(tz.local, 2101),
//               calendarFormat: CalendarFormat.month,
//               onDaySelected: (selectedDay, focusedDay) {
//                 scheduleNotification(selectedDay);
//                 setState(() {
//                   _selectedDateTime = selectedDay;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



