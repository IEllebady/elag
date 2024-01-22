import 'package:elag/constants/images.dart';
import 'package:elag/constants/syles.dart';
import 'package:elag/patients/patient_screen.dart';
import 'package:elag/therapists/therapist_screen.dart';
import 'package:elag/view/auth/cubit/auth_cubit.dart';
import 'package:elag/view/auth/forget_password/forget_password.dart';
import 'package:elag/view/auth/sign_up.dart';
import 'package:elag/view/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is TherapistLoginSuccessState) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TherapistScreen()));
      } else if (state is PatientLoginSuccessState) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PatientsScreen()));
      }
      if (state is FailedToLoginState) {}
    }, builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Welcome"),
            Image.asset(AppImage.logo, height: 170),
            const SizedBox(height: 15),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                    "Sign in with email and password or continue with socail",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium)),
            const SizedBox(height: 35),
            CustomTextFormAuth(
                obscureText: false,
                isNumber: false,
                valid: (val) {
                  return null;
                },
                hintText: "Enter Your Email",
                labelText: "Email",
                iconData: Icons.email_outlined,
                myController: emailController),
            CustomTextFormAuth(
                obscureText: true,
                isNumber: false,
                valid: (val) {
                  return null;
                },
                hintText: "Enter Your Password",
                labelText: "Password",
                iconData: Icons.lock_outline,
                myController: passwordController),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPassword()));
                },
                child: const Text("Forget Password ?",
                    textAlign: TextAlign.right)),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    onPressed: () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        BlocProvider.of<AuthCubit>(context).login(
                            email: emailController.text,
                            password: passwordController.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                                "Please, fill The Textformfield and try again later")));
                      }
                    },
                    color: AppColor.primaryColor_2,
                    textColor: Colors.white,
                    child: const Text("Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)))),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't have an account?"),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: const Text("Sign Up",
                      style: TextStyle(
                          color: AppColor.primaryColor_2,
                          fontWeight: FontWeight.bold)))
            ])
          ]));
    }));
  }
}
