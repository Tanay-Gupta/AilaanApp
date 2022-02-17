import 'package:contestalert/screens/drawerscreen.dart';
import 'package:contestalert/screens/homePageItems/aboutme.dart';
import 'package:contestalert/screens/homePageItems/seeal.dart';
import 'package:contestalert/screens/homepage.dart';
import 'package:contestalert/screens/homescreen.dart';
import 'package:contestalert/screens/widgets/privacy.dart';
import 'package:contestalert/screens/widgets/terms.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'screens/homePageItems/upcoming.dart';
import 'services/themeProvider.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.white));

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ailaan',
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      // theme: ThemeData(

      // ),
      // home: HomePage(),
      routes: {
        '/': (context) => const HomeScreen(),
        '/allcontest': (context) => const SeeAll(),
        '/aboutme': (context) => const AboutMe(),
        '/upcoming': (context) => const UpcomingContest(),
        '/privacy': (context) => const PrivacyPolicy(),
        '/terms': (context) => const TermsAndConditions()
      },
    );
  }
}
