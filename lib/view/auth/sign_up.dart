import 'package:elag/constants/syles.dart';
import 'package:elag/patients/patient_screen.dart';
import 'package:elag/therapists/therapist_screen.dart';
import 'package:elag/view/auth/cubit/auth_cubit.dart';
import 'package:elag/view/auth/login.dart';
import 'package:elag/view/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final chooseController = TextEditingController();
  //String dropdownvalue = 'Patient';

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var items = ["Patient", "Therabists"];
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
              // To remove icon of back screen
              automaticallyImplyLeading: false,
              centerTitle: true,
              elevation: 0.0,
              title: Text('Sign Up',
                  style: Theme.of(context).textTheme.bodyMedium!)),
          body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocProvider.of<AuthCubit>(context).userImgFile != null
                        ? Center(
                            child: Column(children: [
                            CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                    BlocProvider.of<AuthCubit>(context)
                                        .userImgFile!)),
                            const SizedBox(height: 7.5),
                            GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AuthCubit>(context)
                                      .getImage();
                                },
                                child: const Text("Change Photo ",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)))
                          ]))
                        : OutlinedButton(
                            onPressed: () {
                              BlocProvider.of<AuthCubit>(context).getImage();
                            },
                            child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.image),
                                      SizedBox(width: 7),
                                      Text("Select Photo"),
                                      SizedBox(height: 10)
                                    ]))),
                    Text("Welcome Back",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 15),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          "Sign Up WIth Email And Password",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelMedium,
                        )),

                    const SizedBox(height: 35),
                    CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return null;
                        },
                        hintText: "Enter Your Username",
                        labelText: "Username",
                        iconData: Icons.person_outlined,
                        myController: nameController,
                        obscureText: false),
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
                        obscureText: false,
                        isNumber: true,
                        valid: (val) {
                          return null;
                        },
                        hintText: "Enter Your Phone",
                        labelText: "Phone",
                        iconData: Icons.phone,
                        myController: phoneController),
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
                    CustomTextFormAuth(
                        obscureText: false,
                        isNumber: false,
                        valid: (val) {
                          return null;
                        },
                        hintText: "Enter Your Status",
                        labelText: "Status",
                        iconData: Icons.start,
                        myController: chooseController),
                    // DropdownButton(
                    //   // Initial Value
                    //   value: dropdownvalue,

                    //   // Down Arrow Icon
                    //   icon: const Icon(Icons.keyboard_arrow_down),
                    //   // Array list of items
                    //   items: items.map((String items) {
                    //     return DropdownMenuItem(
                    //       value: items,
                    //       child: Text(items),
                    //     );
                    //   }).toList(),
                    //   // After selecting the desired option,it will
                    //   // change button value to selected value
                    //   onChanged: (String? newValue) {
                    //     dropdownvalue = newValue!;
                    //   },
                    // ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        onPressed: () {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            BlocProvider.of<AuthCubit>(context).register(
                                choose: chooseController.text,
                                email: emailController.text,
                                name: nameController.text,
                                password: passwordController.text);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                        "Please, fill The Textformfield and try again later")));
                          }
                        },
                        color: AppColor.primaryColor_2,
                        textColor: Colors.white,
                        child: const Text("Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Have An Account ?"),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: AppColor.primaryColor_2,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ])));
    }, listener: (context, state) {
      if (state is FailedToCreateUserState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red, content: Text(state.message)));
      }
      if (state is PatientCreatedSuccessState) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PatientsScreen()));
      }
      if (state is TherabistCreatedSuccessState) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TherapistScreen()));
      }
    }));
  }
}
