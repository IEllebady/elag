import 'package:elag/constants/syles.dart';
import 'package:elag/view/auth/forget_password/verify_code.dart';
import 'package:elag/view/on_boarding.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  final emailController = TextEditingController();

  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text('Forget Password',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith())),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          Text("Check email",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 15),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "please Enter Your Email Address To Recive A verifiaction code",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              )),
          const SizedBox(height: 15),
          CustomTextFormAuth(
            isNumber: false,
            valid: (val) {
              return null;
            },
            hintText: "Enter Your Email",
            labelText: "Email",
            iconData: Icons.email_outlined,
            myController: emailController,
            obscureText: false,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 13),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerfiyCode()));
              },
              color: AppColor.primaryColor_2,
              textColor: Colors.white,
              child: const Text("Check",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
          // CustomButtonAuth(
          //     text: ,
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => const VerfiyCode()));
          //     }),
          const SizedBox(height: 40)
        ]),
      ),
    );
  }
}
