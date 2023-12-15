
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottomNevigationbar.dart';

class VerifyOtp extends StatefulWidget {
  final String verificationId;
  const VerifyOtp({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String otp = '';
  bool isLoader = false;
  void verifyOTP() async {

    setState(() {
      isLoader = true;
    });
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otp);
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const Bottom_Navigation();
        }));
      }
    } on FirebaseAuthException catch (ex) {
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: AlertDialog(
                iconPadding: EdgeInsets.zero,
                icon: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.cancel,
                              size: 30,
                            ))
                      ],
                    ),
                    const Icon(
                      Icons.warning_rounded,
                      size: 40,
                      color: Colors.red,
                    ),
                  ],
                ),
                content: Text(
                  ex.code.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          });
      print(ex.code.toString());
    }finally {
      setState(() {
        isLoader = false;
      });
    }

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
        width: 56,
        height: 55,
        textStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: Colors.green,
            )));
    return Scaffold(
      extendBodyBehindAppBar: true,
      //backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            bottom: 70,
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('assets/images/second.png'),
              ),
              const SizedBox(
                height: 50,
              ),


              Text(
                'Enter OTP Here',
                style:
                GoogleFonts.abrilFatface(fontSize: 20, color: Colors.green),
              ),
            const  SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(
                            color: Colors.green,
                          ),
                        )),
                    onCompleted: (pin) {
                      setState(() {
                        otp = pin;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              if (isLoader) const Center(child: CircularProgressIndicator()),

              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: TextButton(
                      onPressed: () {
                       isLoader ? null : verifyOTP();
                      },
                      child: const Text("verify OTP",
                          textAlign: TextAlign.center,
                          style:
                          //  height: 2,
                          TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ))),


          ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
