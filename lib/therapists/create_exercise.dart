import 'package:elag/constants/syles.dart';
import 'package:elag/therapists/therapist_screen.dart';
import 'package:elag/view/auth/cubit/auth_cubit.dart';
import 'package:elag/view/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateExercise extends StatelessWidget {
  final exerciseName = TextEditingController();
  final exerciseBody = TextEditingController();
  final exerciseSteps = TextEditingController();

  CreateExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
      return Scaffold(
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
                    const SizedBox(height: 15),
                    CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return null;
                        },
                        hintText: "Enter ExerciseName",
                        labelText: "Exercise Name",
                        iconData: Icons.person_outlined,
                        myController: exerciseName,
                        obscureText: false),
                    CustomTextFormAuth(
                        obscureText: false,
                        isNumber: false,
                        valid: (val) {
                          return null;
                        },
                        hintText: "Enter ExerciseBody",
                        labelText: "Exercise Body",
                        iconData: Icons.email_outlined,
                        myController: exerciseBody),

                    Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                            obscureText: false,
                            validator: (val) {
                              return null;
                            },
                            controller: exerciseSteps,
                            decoration: InputDecoration(
                                hintText: "Enter ExerciseSteps",
                                hintStyle: const TextStyle(fontSize: 14),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 30),
                                label: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 9),
                                    child: const Text("Steps")),
                                suffixIcon: const Icon(Icons.phone),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))))),
                    // CustomTextFormAuth(
                    //     obscureText: false,
                    //     isNumber: false,
                    //     valid: (val) {
                    //       return null;
                    //     },
                    //     hintText: "Enter ExerciseSteps",
                    //     labelText: "Steps",
                    //     iconData: Icons.phone,
                    //     myController: exerciseSteps),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          onPressed: () {
                            if (exerciseName.text.isNotEmpty &&
                                exerciseBody.text.isNotEmpty &&
                                exerciseSteps.text.isNotEmpty) {
                              BlocProvider.of<AuthCubit>(context)
                                  .storeExerciseDataToFireStore(
                                      exerciseName: exerciseName.text,
                                      exerciseBody: exerciseBody.text,
                                      exerciseSteps: exerciseSteps.text);
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
                          child: const Text("Add Exercise",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ))
                  ])));
    }, listener: (context, state) {
      if (state is FailedToCreateUserState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red, content: Text(state.message)));
      }
      if (state is SaveExerciseDataOnFirestoreSuccessState) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TherapistScreen()));
      }
    }));
  }
}
