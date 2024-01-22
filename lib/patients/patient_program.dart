import 'package:elag/constants/cards.dart';
import 'package:elag/constants/syles.dart';
import 'package:elag/exercise_screen.dart';
import 'package:flutter/material.dart';

class PatientProgram extends StatefulWidget {
  const PatientProgram({Key? key}) : super(key: key);

  @override
  State<PatientProgram> createState() => PatientProgramState();
}

class PatientProgramState extends State<PatientProgram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(color: AppColor.gradientFirst.withOpacity(0.9)),
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.5,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 8, top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                  color: AppColor.loopColor.withOpacity(0.4),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.secondPageTopIconColor
                                          .withOpacity(0.1),
                                      offset: const Offset(0, 5),
                                      blurRadius: 10,
                                      spreadRadius: 4,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.keyboard_double_arrow_left_sharp,
                                    size: 24,
                                    color: AppColor.secondPageIconColor,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 8, top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                  color: AppColor.loopColor.withOpacity(0.6),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.secondPageTopIconColor
                                          .withOpacity(0.1),
                                      offset: const Offset(0, 5),
                                      blurRadius: 10,
                                      spreadRadius: 4,
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.person,
                                    size: 24,
                                    color: AppColor.secondPageIconColor,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 8, bottom: 8),
                              child: Text('Your Plan For Today!',
                                  style: AppDesign.cardName))
                        ]))),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 32),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColor.homePageContainerTextSmall,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(75),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ExerciseCard2(
                        exerciseName: 'SLR Flexion',
                        exerciseInformation:
                            'OKC exercise to strength hip flexors and knee extensors',
                        exerciseImagePath: 'assets/images/StraightLegRaise.gif',
                        onClickEx: () {},
                      ),
                      ExerciseCard2(
                        exerciseName: 'SLR Extension',
                        exerciseInformation:
                            'OKC exercise to strength hip extensors [Gluteus Maximus & Hamstring]',
                        exerciseImagePath: 'assets/images/slr extension.gif',
                        onClickEx: () {},
                      ),
                      ExerciseCard2(
                        exerciseName: 'SLR Abduction',
                        exerciseInformation:
                            'OKC exercise to strength hip abductors [Gluteus Medius]',
                        exerciseImagePath: 'assets/images/slr abd.gif',
                        onClickEx: () {},
                      ),
                      ExerciseCard2(
                        exerciseName: 'Clamshell',
                        exerciseInformation:
                            'OKC exercise to strength hip external rotators',
                        exerciseImagePath: 'assets/images/clams.gif',
                        onClickEx: () {},
                      ),
                      ExerciseCard2(
                        exerciseName: 'Quadriceps set',
                        exerciseInformation:
                            'isometric exercise to strength quadriceps',
                        exerciseImagePath: 'assets/images/quads set.gif',
                        onClickEx: () {},
                      ),
                      ExerciseCard2(
                        exerciseName: 'Hamstring set',
                        exerciseInformation:
                            'isometric exercise to strength hamstring',
                        exerciseImagePath: 'assets/images/hamstring set.gif',
                        onClickEx: () {},
                      ),
                      ExerciseCard2(
                        exerciseName: 'Mini Squats',
                        exerciseInformation:
                            'CKC  exercise to strength quadriceps with a limited ROM',
                        exerciseImagePath: 'assets/images/squat.gif',
                        onClickEx: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExerciseScreen0(),
                      ),
                    );
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Start Now!',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
