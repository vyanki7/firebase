import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onesignal/screen/HomePage.dart';
import 'package:onesignal/screen/sigin_screen.dart' show SignInScreen;
import 'package:onesignal/screen/sigup_screen.dart';
import 'firebase_options.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  print("*********** Firebase is initialized ****************");
  // Enable verbose logging for debugging (remove in production)
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  // Initialize OneSignal with your App ID
  OneSignal.initialize("73c086eb-393d-4d85-9c05-a6a0512162d0");

  // Ask notification permission on iOS (Android auto-grants)
  OneSignal.Notifications.requestPermission(true);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Handle notification taps
    // OneSignal.Notifications.addClickListener((event) {
    //   final data = event.notification.additionalData;
    //
    //   if (data != null) {
    //     final screen = data["screen"];
    //     if (screen == "details") {
    //       Navigator.pushNamed(context, "/details");
    //     } else if (screen == "profile") {
    //       Navigator.pushNamed(context, "/profile");
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OneSignal Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SignInScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/homepage': (context) => const Homepage(),

      },
    );
  }
}
