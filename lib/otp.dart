import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_no_login/phone.dart';
import 'package:pinput/pinput.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final defaultPinTheme = PinTheme(
    width: 40,
    height: 40,
    textStyle: TextStyle(
        fontSize: 20, color: Colors.purple, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.purpleAccent),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  PinTheme get focusedPinTheme => defaultPinTheme.copyDecorationWith(
        border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(8),
      );

  PinTheme get submittedPinTheme => defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration?.copyWith(
          color: Colors.black,
        ),
      );

  @override
  Widget build(BuildContext context) {
    var code = "";
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "PHONE  VERIFICATION",
          style: TextStyle(fontSize: 24, color: Colors.grey, letterSpacing: 4),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 50,
              shadowColor: Colors.purple,
              borderOnForeground: true,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'homepage.png',
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '0000' ? null : 'wrong otp';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: MyPhone.verify, smsCode: code);
                  
                  await auth.signInWithCredential(credential);
                  Navigator.pushNamed(context, "home");
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    side: BorderSide(
                        color: Colors.purple,
                        width: 1,
                        style: BorderStyle.solid)),
                child: Text(
                  "Verify Phone Number",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "phone");
              },
              child: Text(
                "Edit Phone Number ?",
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }

  goToHomepage() {
    Navigator.pushNamed(context, 'home');
  }
}
