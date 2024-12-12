import 'package:flutter/material.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});

  static String verify = '';
  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryCode = TextEditingController();
  var phoneNo = "";

  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                height: 150,
                width: 150,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 300,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  child: TextField(
                      controller: countryCode,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      )),
                ),
                SizedBox(
                  width: 20,
                  child: Center(
                      child: Text(
                    "|",
                    style: TextStyle(
                        fontSize: 30,
                        color: const Color.fromARGB(255, 193, 69, 215)),
                  )),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    onChanged: (value) {
                      phoneNo = value;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "otp");
              },
              //() async {
              //   await FirebaseAuth.instance.verifyPhoneNumber(
              //     phoneNumber: '${countryCode.text + phoneNo}',
              //     verificationCompleted: (PhoneAuthCredential credential) {},
              //     verificationFailed: (FirebaseAuthException e) {},
              //     codeSent: (String verificationId, int? resendToken) {
              //       // MyPhone.verify = verificationId;

              //     },
              //     codeAutoRetrievalTimeout: (String verificationId) {},
              //   );

              // },
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
                "GET OTP",
                style: TextStyle(
                  fontSize: 18,
                ),
              )),
        ],
      )),
    );
  }
}
