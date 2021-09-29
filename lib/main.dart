import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/detail_view_controller.dart';
import 'controllers/home_controller.dart';
import 'package:flutter_appcenter_bundle/flutter_appcenter_bundle.dart';
import 'pages/homepage.dart';
import 'pages/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void initAppCenter() async {
  await AppCenter.startAsync(
    appSecretAndroid: '1500380d-a583-4efa-baad-49d3f117cfe1',
    appSecretIOS: '******',
    enableAnalytics: true,
    enableCrashes: true,
    enableDistribute: true,
    usePrivateDistributeTrack: false,
    disableAutomaticCheckForUpdate: false,
  );
}

// /*
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}
//*/

Future<void> main() async {
  initAppCenter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // /*
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  // */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(Homecontroller());
    Get.put(Detailviewcontroller());
    return GetMaterialApp(
      home: HomePage(),
      theme: ThemeData(fontFamily: 'Alef'),
      debugShowCheckedModeBanner: false,
    );
  }
}
