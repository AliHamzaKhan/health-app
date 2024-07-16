// import 'dart:async';
// import 'dart:io';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:health_app/utils/app_print.dart';
//
// import '../services/auth_service.dart';
//
// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   appDebugPrint('Handling a background message ${message.messageId}');
//   appDebugPrint('Handling a background message ${message.messageType}');
//   appDebugPrint('Handling a background message ${message.notification!.title}');
//   appDebugPrint('Handling a background message ${message.notification!.body}');
// }
//
// getFcmToken() async {
//   return await FirebaseMessaging.instance.getToken();
// }
//
// FirebaseMessaging messaging = FirebaseMessaging.instance;
//
// const String navigationActionId = 'id_3';
//
// const String darwinNotificationCategoryText = 'textCategory';
//
// const String darwinNotificationCategoryPlain = 'plainCategory';
//
// class NotificationService {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   int id = 0;
//   bool isPermissionRequestInProgress = false;
//   static final NotificationService _notificationService =
//       NotificationService._internal();
//
//   factory NotificationService() {
//     return _notificationService;
//   }
//
//   NotificationService._internal();
//
//   init() {
//     if (Platform.isAndroid) {
//       requestNotificationPermissions();
//     } else {
//       requestNotificationPermissionsForIos();
//     }
//     // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/launcher_icon');
//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//             onDidReceiveLocalNotification: onDidReceiveLocalNotification);
//     final LinuxInitializationSettings initializationSettingsLinux =
//         const LinuxInitializationSettings(defaultActionName: 'Open notification');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: initializationSettingsAndroid,
//             iOS: initializationSettingsDarwin,
//             linux: initializationSettingsLinux);
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
//   }
//
//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {}
//
//   void onDidReceiveNotificationResponse(
//       NotificationResponse notificationResponse) async {
//     final String? payload = notificationResponse.payload;
//     if (notificationResponse.payload != null) {
//       appDebugPrint('notification payload: $payload');
//     }
//   }
//
//   Future<void> showNotification({title, body, payload}) async {
//     AuthService authService = Get.find();
//     AndroidNotificationDetails androidNotificationDetails =
//         const AndroidNotificationDetails('...', '...',
//             icon: 'launcher_icon', playSound: true
//             // '...',
//             // actions: <AndroidNotificationAction>[
//             //   // AndroidNotificationAction('id_1', 'Action 1'),
//             //   // AndroidNotificationAction('id_2', 'Action 2'),
//             //   // AndroidNotificationAction('id_3', 'Action 3'),
//             // ],
//             );
//      DarwinNotificationDetails iosSetting = const DarwinNotificationDetails(
//       presentAlert: true,
//       presentBadge: true,
//       presentSound: true,
//     );
//
//      NotificationDetails notificationDetails = NotificationDetails(
//         android: androidNotificationDetails, iOS: iosSetting);
//
//     await flutterLocalNotificationsPlugin
//         .show(id++, title, body, notificationDetails, payload: payload);
//   }
//
//   Future<void> requestNotificationPermissions() async {
//     if (isPermissionRequestInProgress) {
//       appDebugPrint("Permission request is already in progress.");
//       return;
//     }
//
//     isPermissionRequestInProgress = true;
//
//     try {
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin>()
//           ?.requestNotificationsPermission();
//     } catch (e) {
//       appDebugPrint("Error requesting notification permissions: $e");
//     }
//
//     isPermissionRequestInProgress = false;
//   }
//
//   Future<void> requestNotificationPermissionsForIos() async {
//     if (isPermissionRequestInProgress) {
//       appDebugPrint("Permission request is already in progress.");
//       return;
//     }
//     isPermissionRequestInProgress = true;
//     try {
//       bool? result = await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               IOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//           );
//       if (result != null) {
//         isPermissionRequestInProgress = result;
//       }
//     } catch (e) {
//       appDebugPrint("Error requesting notification permissions: $e");
//     }
//     isPermissionRequestInProgress = false;
//   }
//
//   final DarwinInitializationSettings initializationSettingsDarwin =
//       const DarwinInitializationSettings(
//     notificationCategories: [
//       DarwinNotificationCategory(
//         'demoCategory',
//         // actions: <DarwinNotificationAction>[ // todo
//         //   DarwinNotificationAction.plain('id_1', 'Action 1'),
//         //   DarwinNotificationAction.plain(
//         //     'id_2',
//         //     'Action 2',
//         //     options: <DarwinNotificationActionOption>{
//         //       DarwinNotificationActionOption.destructive,
//         //     },
//         //   ),
//         //   DarwinNotificationAction.plain(
//         //     'id_3',
//         //     'Action 3',
//         //     options: <DarwinNotificationActionOption>{
//         //       DarwinNotificationActionOption.foreground,
//         //     },
//         //   ),
//         // ],
//         options: <DarwinNotificationCategoryOption>{
//           DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
//         },
//       )
//     ],
//   );
// }
