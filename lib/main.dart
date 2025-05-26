// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:local_notications2/my_app.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   final AndroidInitializationSettings androidInitializationSettings =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//   final DarwinInitializationSettings iosInitializationSettings =
//       DarwinInitializationSettings(
//           requestAlertPermission: false,
//           requestBadgePermission: false,
//           requestSoundPermission: false,
//           onDidReceiveLocalNotification:
//               (int id, String? title, String? body, String? payload) async {});

//   final InitializationSettings initializationSettings = InitializationSettings(
//     android: androidInitializationSettings,
//     iOS: iosInitializationSettings,
//   );

//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//   runApp(MyApp());
// }



import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:timezone/data/latest.dart' as tz;

import 'Services/notifi_service.dart';
import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notifications',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Local Notifications'),
    );
  }
}