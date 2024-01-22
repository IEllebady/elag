import 'package:elag/constants/syles.dart';
import 'package:elag/view/auth/forget_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          'Verifiaction code',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          Text('Check email',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith()),
          const SizedBox(height: 15),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                  "Please Enter The digit code sent to AhmedHegab2026@gmail.com",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium)),
          const SizedBox(height: 65),
          OtpTextField(
            fieldWidth: 50.0,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderColor: const Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResetPassword()));
            }, // end onSubmit
          ),
          const SizedBox(height: 40)
        ]),
      ),
    );
  }
}
