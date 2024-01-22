import 'package:elag/constants/cards.dart';
import 'package:elag/constants/syles.dart';
import 'package:flutter/material.dart';

class CreateProgram extends StatefulWidget {
  const CreateProgram({Key? key}) : super(key: key);

  @override
  State<CreateProgram> createState() => _CreateProgramState();
}

class _CreateProgramState extends State<CreateProgram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          decoration: const BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(70.0))),
          height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Positioned.fill(
                child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      AppColor.secondPageTopIconColor
                          .withOpacity(0.4), // Adjust opacity here
                      BlendMode.srcOver, // You can use other blend modes
                    ),
                    child: Image.asset(
                      'assets/images/home program.png',
                      fit: BoxFit.fill,
                    ))),
            Positioned(
                top: 16,
                left: 16,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color:
                                  AppColor.homePagePlanColor.withOpacity(0.2),
                              offset: const Offset(0, 5),
                              blurRadius: 10,
                              spreadRadius: 5)
                        ]),
                    child: IconButton(
                        icon: Icon(
                          Icons.keyboard_double_arrow_left_sharp,
                          size: 24,
                          color: AppColor.gradientFirst.withOpacity(0.8),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }))),
            Positioned(
                top: 16,
                right: 16,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.homePagePlanColor.withOpacity(0.2),
                          offset: const Offset(0, 5),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.search_sharp,
                          size: 24,
                          color: AppColor.gradientFirst.withOpacity(0.8),
                        ),
                        onPressed: () {}))),
            Positioned(
                bottom: 8,
                left: 20,
                child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 50,
                    color: Colors.white.withOpacity(0.75),
                    margin: const EdgeInsets.only(left: 8),
                    child: Wrap(children: [
                      Text(
                          'Create your own exercise program easily. Choose and select exercises from the list below',
                          style: TextStyle(
                            color: AppColor.homePageTitle,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify)
                    ])))
          ])),
      // DefaultTabController(
      //     length: 8,
      //     child: TabBar(
      //         onTap: (selectedTabIndex) {},
      //         isScrollable: true,
      //         tabs: const [
      //           Tab(child: Text('All', style: TextStyle(color: Colors.black))),
      //           Tab(
      //             child: Text('Strengthening',
      //                 style: TextStyle(color: Colors.black)),
      //           ),
      //           Tab(
      //               child: Text('Stretching',
      //                   style: TextStyle(color: Colors.black))),
      //           Tab(
      //             child:
      //                 Text('Isometric', style: TextStyle(color: Colors.black)),
      //           ),
      //           Tab(
      //             child: Text('Proprioception',
      //                 style: TextStyle(color: Colors.black)),
      //           ),
      //           Tab(
      //             child: Text('Balance', style: TextStyle(color: Colors.black)),
      //           ),
      //           Tab(
      //             child: Text('AAROM', style: TextStyle(color: Colors.black)),
      //           ),
      //           Tab(
      //             child:
      //                 Text('Functional', style: TextStyle(color: Colors.black)),
      //           ),
      //           Tab(child: Text('Gait', style: TextStyle(color: Colors.black)))
      //         ])),
      const SizedBox(height: 10),
      Expanded(
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration:
                  BoxDecoration(color: AppColor.homePageContainerTextSmall),
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ExerciseCard(
                            exerciseName: 'SLR Flexion',
                            exerciseInformation:
                                'OKC exercise to strength hip flexors and knee extensors',
                            exerciseImagePath:
                                'assets/images/StraightLegRaise.gif',
                            onClickEx: () {}),
                        ExerciseCard(
                            exerciseName: 'SLR Extension',
                            exerciseInformation:
                                'OKC exercise to strength hip extensors [Gluteus Maximus & Hamstring]',
                            exerciseImagePath:
                                'assets/images/slr extension.gif',
                            onClickEx: () {}),
                        ExerciseCard(
                            exerciseName: 'SLR Abduction',
                            exerciseInformation:
                                'OKC exercise to strength hip abductors [Gluteus Medius]',
                            exerciseImagePath: 'assets/images/slr abd.gif',
                            onClickEx: () {}),
                        ExerciseCard(
                            exerciseName: 'Clamshell',
                            exerciseInformation:
                                'OKC exercise to strength hip external rotators',
                            exerciseImagePath: 'assets/images/clams.gif',
                            onClickEx: () {}),
                        ExerciseCard(
                            exerciseName: 'Quadriceps set',
                            exerciseInformation:
                                'isometric exercise to strength quadriceps',
                            exerciseImagePath: 'assets/images/quads set.gif',
                            onClickEx: () {}),
                        ExerciseCard(
                            exerciseName: 'Hamstring set',
                            exerciseInformation:
                                'isometric exercise to strength hamstring',
                            exerciseImagePath:
                                'assets/images/hamstring set.gif',
                            onClickEx: () {}),
                        ExerciseCard(
                            exerciseName: 'Mini Squats',
                            exerciseInformation:
                                'CKC  exercise to strength quadriceps with a limited ROM',
                            exerciseImagePath: 'assets/images/squat.gif',
                            onClickEx: () {}),
                      ])))),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Material(
              elevation: 5.0,
              color: AppColor.gradientFirst.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10.0),
              child: MaterialButton(
                  onPressed: () {},
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text('Share Program',
                      style: TextStyle(fontSize: 16, color: Colors.white)))))
    ]));
  }
}
