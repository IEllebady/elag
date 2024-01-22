import 'package:elag/constants/syles.dart';
import 'package:flutter/material.dart';

class Exercise extends StatefulWidget {
  const Exercise({Key? key}) : super(key: key);

  @override
  State<Exercise> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColor.gradientFirst,
                AppColor.gradientFirst.withOpacity(0.9)
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.bottomLeft),
        ),
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 320,
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 8, top: 8, bottom: 16),
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
                                margin: const EdgeInsets.only(left: 12),
                                width: MediaQuery.of(context).size.width - 100,
                                height: 5,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  child: LinearProgressIndicator(
                                    value:
                                        0.4, // Set the progress value (e.g., 0.5 for 50%)
                                    backgroundColor: Colors.white.withOpacity(
                                        0.8), // Customize the background color
                                    valueColor: const AlwaysStoppedAnimation<
                                            Color>(
                                        Colors
                                            .green), // Customize the progress bar color
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                color: AppColor.homePageContainerTextSmall,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Column(children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    'SLR Flexion',
                                    style: AppDesign.listCardName,
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    height: 190,
                                    child: Image.asset(
                                        'assets/images/StraightLegRaise.gif',
                                        fit: BoxFit.cover))
                              ]))
                        ]))),
            const SizedBox(height: 8),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(24),
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: AppColor.homePageContainerTextSmall,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'step 1: Lie on your back with your legs straight',
                                    style: AppDesign.listCardName),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'step 2: Tighten your quadriceps (the muscles on the front of your thighs',
                                    style: AppDesign.listCardName),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'step 3: Keeping your knee straight, lift one leg off the ground.',
                                      style: AppDesign.listCardName)),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'step 4: Raise your leg until till be at the same level as your other leg.',
                                      style: AppDesign.listCardName)),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'step 5: Hold the lifted position briefly.',
                                      style: AppDesign.listCardName)),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'step 6: Lower your leg back down with control.',
                                      style: AppDesign.listCardName)),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'step 7:  Repeat for 15 repetitions.',
                                      style: AppDesign.listCardName)),
                            ])))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16, right: 24),
                  decoration: BoxDecoration(
                    color: AppColor.loopColor.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.gradientFirst.withOpacity(0.6),
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 24,
                      color: AppColor.secondPageIconColor,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseScreen0 extends StatefulWidget {
  const ExerciseScreen0({super.key});

  @override
  State<ExerciseScreen0> createState() => ExerciseScreen0State();
}

class ExerciseScreen0State extends State<ExerciseScreen0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColor.gradientFirst,
                AppColor.gradientFirst.withOpacity(0.9)
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.bottomLeft),
        ),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 320,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              right: 8, top: 8, bottom: 16),
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
                          margin: const EdgeInsets.only(left: 12),
                          width: MediaQuery.of(context).size.width - 100,
                          height: 5,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            child: LinearProgressIndicator(
                              value:
                                  0.0, // Set the progress value (e.g., 0.5 for 50%)
                              backgroundColor: Colors.white.withOpacity(
                                  0.8), // Customize the background color
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors
                                      .green), // Customize the progress bar color
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                        color: AppColor.homePageContainerTextSmall,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              'Quadriceps Set',
                              style: AppDesign.listCardName,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 16),
                            width: MediaQuery.of(context).size.width - 60,
                            height: 190,
                            child: Image.asset(
                              'assets/images/quads set.gif',
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  color: AppColor.homePageContainerTextSmall,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'step 1: Sit or lie down with your leg extended',
                          style: AppDesign.listCardName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'step 2: Tighten the muscles on the front of your thigh as much as you can.',
                          style: AppDesign.listCardName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'step 3:  Hold this contraction for a few seconds.',
                          style: AppDesign.listCardName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'step 4:  Relax and repeat for 15 repetitions.',
                          style: AppDesign.listCardName,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16, right: 24),
                  decoration: BoxDecoration(
                    color: AppColor.loopColor.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.gradientFirst.withOpacity(0.6),
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 24,
                      color: AppColor.secondPageIconColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExerciseScreen2(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseScreen2 extends StatefulWidget {
  const ExerciseScreen2({super.key});

  @override
  State<ExerciseScreen2> createState() => ExerciseScreen00State();
}

class ExerciseScreen00State extends State<ExerciseScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                AppColor.gradientFirst,
                AppColor.gradientFirst.withOpacity(0.9)
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.bottomLeft),
        ),
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 320,
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 8, top: 8, bottom: 16),
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
                                margin: const EdgeInsets.only(left: 12),
                                width: MediaQuery.of(context).size.width - 100,
                                height: 5,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  child: LinearProgressIndicator(
                                    value:
                                        0.2, // Set the progress value (e.g., 0.5 for 50%)
                                    backgroundColor: Colors.white.withOpacity(
                                        0.8), // Customize the background color
                                    valueColor: const AlwaysStoppedAnimation<
                                            Color>(
                                        Colors
                                            .green), // Customize the progress bar color
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 1.1,
                              decoration: BoxDecoration(
                                color: AppColor.homePageContainerTextSmall,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Column(children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    'Hamstring set',
                                    style: AppDesign.listCardName,
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    height: 190,
                                    child: Image.asset(
                                        'assets/images/hamstring set.gif',
                                        fit: BoxFit.cover))
                              ]))
                        ]))),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                  color: AppColor.homePageContainerTextSmall,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'step 1: Sit or lie down with your leg extended',
                          style: AppDesign.listCardName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'step 2: Put a towel or roll under your heel',
                          style: AppDesign.listCardName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'step 3: press the roll down with your heel while keeping your leg straight.',
                          style: AppDesign.listCardName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'step 4: Relax and repeat for 15 repetitions.',
                          style: AppDesign.listCardName,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16, right: 24),
                  decoration: BoxDecoration(
                    color: AppColor.loopColor.withOpacity(0.4),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.gradientFirst.withOpacity(0.6),
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 24,
                      color: AppColor.secondPageIconColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Exercise(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
