import 'package:elag/constants/cards.dart';
import 'package:elag/constants/syles.dart';
import 'package:elag/controller/cubit/layout_cubit.dart';
import 'package:elag/patients/patient_program.dart';
import 'package:elag/therapists/therapist_list_screen.dart';
import 'package:elag/therapists/therapists_chat_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({Key? key}) : super(key: key);

  @override
  State<PatientsScreen> createState() => PatientHomePageState();
}

class PatientHomePageState extends State<PatientsScreen> {
  @override
  Widget build(BuildContext context) {
    final layoutCubit = BlocProvider.of<LayoutCubit>(context)
      ..getUsersData()
      ..getPatient()
      ..getTherapist()
      ..getUsers();

    return BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        AppColor.gradientFirst.withOpacity(0.9),
                        AppColor.gradientSecond,
                      ],
                          begin: const FractionalOffset(0.0, 0.4),
                          end: Alignment.topRight)),
                  child: Column(children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3.9,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //back arrow
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 8, top: 8, bottom: 16),
                                    decoration: BoxDecoration(
                                      color:
                                          AppColor.loopColor.withOpacity(0.4),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.secondPageTopIconColor
                                              .withOpacity(0.2),
                                          offset: const Offset(
                                              0, 5), // Set the shadow offset
                                          blurRadius:
                                              10, // Set the shadow blur radius
                                          spreadRadius: 4,
                                        ),
                                      ],
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                          Icons
                                              .keyboard_double_arrow_left_sharp,
                                          size: 24,
                                          color: AppColor.secondPageIconColor),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  //Text("Hello  ${layoutCubit.userModel!.name!}",
                                  // style: AppDesign.cardName),
                                  const SizedBox(height: 16),
                                  Text(
                                      'we will connect you with your doctor to provide the suitable exercise program that fits you, To ensure good results of your treatment',
                                      style: AppDesign.cardDescription,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis)
                                ]))),
                    Expanded(
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: AppColor.homePageContainerTextSmall,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(50),
                                    topLeft: Radius.circular(50))),
                            child: SingleChildScrollView(
                                child: Column(children: [
                              const SizedBox(height: 30),
                              // CardDemo(
                              //     click: () {
                              //       Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   const PatientInfScreen()));
                              //     },
                              //     metPath: "assets/images/fill information.png",
                              //     mainText: 'Fill Information',
                              //     descriptionText: ''),
                              CardDemo(
                                  click: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TherabistsListScreen()));
                                  },
                                  metPath: "assets/images/doctor.png",
                                  mainText: 'Choose Doctor',
                                  descriptionText: ''),
                              CardDemo(
                                  click: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PatientProgram()));
                                  },
                                  metPath: "assets/images/home program.png",
                                  mainText: 'Exercise Program',
                                  descriptionText: ''),
                              CardDemo(
                                  click: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TherabistsChatListScreen()));
                                  },
                                  metPath: "assets/images/doctor.png",
                                  mainText: 'Chat Doctor',
                                  descriptionText: ''),
                            ]))))
                  ])));
        });
  }
}
