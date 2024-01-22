import 'package:elag/constants/syles.dart';
import 'package:elag/view/auth/login.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svgs/docdoc_logo.svg'),
                            const SizedBox(width: 10),
                            Text('DocDoc',
                                style: TextStyles.font24Black700Weight)
                          ]),
                      const SizedBox(height: 30),
                      Stack(children: [
                        SvgPicture.asset(
                            'assets/svgs/docdoc_logo_low_opacity.svg'),
                        Container(
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: const [0.14, 0.4],
                            ),
                          ),
                          child: Image.asset(
                              'assets/images/onboarding_doctor.png'),
                        ),
                        Positioned(
                            bottom: 30,
                            left: 0,
                            right: 0,
                            child: Text('Best Doctor\nAppointment App',
                                textAlign: TextAlign.center,
                                style: TextStyles.font32BlueBold
                                    .copyWith(height: 1.4)))
                      ]),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(children: [
                            Text(
                              'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                              style: TextStyles.font13GrayRegular,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColor.mainBlue),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: MaterialStateProperty.all(
                                    const Size(double.infinity, 52),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                                child: Text('Get Started',
                                    style: TextStyles.font16WhiteSemiBold))
                          ]))
                    ])))));
  }
}

class CustomTextFormAuth extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController myController;
  final String? Function(String?)? valid;
  final bool isNumber;
  final bool obscureText;

  const CustomTextFormAuth(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.iconData,
      this.valid,
      required this.isNumber,
      required this.myController,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: TextFormField(
            obscureText: obscureText,
            keyboardType: isNumber
                ? const TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
            validator: valid,
            controller: myController,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                label: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 9),
                    child: Text(labelText)),
                suffixIcon: Icon(iconData),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)))));
  }
}
