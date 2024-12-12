import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_no_login/homepage.dart';
import 'package:phone_no_login/otp.dart';
import 'package:phone_no_login/phone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyBX-EAEnk6f2lCY3nYiXRXxM_KnjS3h9aA',
          appId: '1:486044853617:web:faadb3c15fac7dd2c142d0' ,
          messagingSenderId: '486044853617',
          projectId: "phone-login-firebase-f5dd6"),
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData.from(
            colorScheme: ColorScheme.dark(surface: Colors.black)),
        initialRoute: 'phone',
        routes: {
          'phone': (context) => MyPhone(),
          'otp': (context) => MyOtp(),
          'home': (context) => Homepage()
        });
  }
}
