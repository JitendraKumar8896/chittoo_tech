import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'verifyOTP.dart';


class Mobilelogin extends StatefulWidget {
  const Mobilelogin({super.key});

  @override
  State<Mobilelogin> createState() => _MobileloginState();
}

class _MobileloginState extends State<Mobilelogin> {
  bool isLoader = false;
  TextEditingController phoneController = TextEditingController();

   String phone = "";
  void validatePhone(){

    phone = "+91" + phoneController.text.trim();
    if(phone != '' && phone.length==13){
      print("You Enter Valid Number");
      sendOTP();

    }
    else{
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: AlertDialog(
                iconPadding: EdgeInsets.zero,
                //  contentPadding: EdgeInsets.zero,
                icon: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.cancel, size: 30,))],
                    ),
                    const Icon(
                      Icons.warning_rounded,
                      size: 40,
                      color: Colors.red,
                    ),
                  ],
                ),
                content: const Text(
                  'You Enter Invalid Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),


            );
          });

    }
  }




  void sendOTP() async {
    setState(() {
      isLoader = true;
    });

    //String phone = "+91${phoneController.text.trim()}";
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (verificationID, resendToken) {
          setState(() {
           // Variable.phoneNo=phone;
            isLoader = false;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return VerifyOtp(
              verificationId: verificationID,
            );
          }));
        },

        verificationCompleted: (Credential) {},
        verificationFailed: (ex) {
          print(ex.code.toString());
          showDialog(
              context: context,
              builder: (context) {
                return const Center();
              });
        },

        codeAutoRetrievalTimeout: (verificationid) {},
        timeout: const Duration(seconds: 30));
    log("Sending.. otp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      //  backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 70,
                  bottom: 30,
                ),

              ),
            ),
            const CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage('assets/images/first.png'),
            ),
            // Image.asset(
            //   '',
            //   height: 250,
            //   width: 250,
            // //color: Colors.transparent,
            // ),
            SizedBox(height: 10,),
            if (isLoader)
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
          const  SizedBox(height: 20,),
            const Text(
              'Register Mobile number',
              style: TextStyle(
                fontSize: 22,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  hintText: ('📞    Phone Number'),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),


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
                               isLoader ? null : validatePhone();

//                      isLoading ? null : validatePhone();
                    },
                    child: const Text("Register",
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
          // const SizedBox(height: 300,),
          ],
        ),
      ),
    );
  }
}