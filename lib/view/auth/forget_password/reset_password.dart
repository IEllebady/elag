import 'package:elag/constants/syles.dart';
import 'package:elag/view/auth/forget_password/success_reset_password.dart';
import 'package:elag/view/on_boarding.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text('ResetPassword',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith())),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          Text("New Password",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 15),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Please Enter new Password",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              )),
          const SizedBox(height: 65),
          CustomTextFormAuth(
              isNumber: false,
              valid: (val) {
                return null;
              },
              hintText: "Enter Your Password",
              labelText: "Password",
              iconData: Icons.lock_outline,
              myController: passwordController,
              obscureText: false),
          CustomTextFormAuth(
            isNumber: false,
            valid: (val) {
              return null;
            },
            hintText: "Re Enter Your Password",
            labelText: "Password",
            iconData: Icons.lock_outline,
            myController: rePasswordController,
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
                        builder: (context) => const SuccessResetPassword()));
              },
              color: AppColor.primaryColor_2,
              textColor: Colors.white,
              child: const Text("Save",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
          const SizedBox(height: 40)
        ]),
      ),
    );
  }
}
