// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest_all.dart' as tz;

// class NotificationService {
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     // Initialize the timezone database
//     tz.initializeTimeZones();

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     final InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//     );
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> scheduleNotification(DateTime scheduledDate, String title, String body) async {
//     // Convert DateTime to TZDateTime
//     final tz.TZDateTime tzScheduledDate = tz.TZDateTime.from(
//       scheduledDate,
//       tz.local,
//     );

//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//     );
//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//     );
//     await _flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       title,
//       body,
//       tzScheduledDate,
//       notificationDetails,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }
// }
