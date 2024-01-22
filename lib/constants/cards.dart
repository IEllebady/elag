import 'package:flutter/material.dart';
import 'syles.dart';

class CardDemo extends StatelessWidget {
  final Function click;
  final String metPath;
  final String mainText;
  final String descriptionText;

  const CardDemo({
    super.key,
    required this.click,
    required this.metPath,
    required this.mainText,
    required this.descriptionText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          click();
        },
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                decoration: BoxDecoration(
                  color: AppColor.secondPageContainerGradient2ndColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.secondPageContainerGradient2ndColor
                          .withOpacity(0.25), // Set the shadow color
                      offset: const Offset(0, 5), // Set the shadow offset
                      blurRadius: 10, // Set the shadow blur radius
                      spreadRadius: 10,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width / 1.1,
                height: 150,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 150,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                              ),
                              child: Image.asset(metPath, fit: BoxFit.cover))),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(right: 16, left: 16),
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 12),
                                child: Text(
                                  mainText,
                                  style: AppDesign.cardName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                descriptionText,
                                style: AppDesign.cardDescription,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: IconButton(
                              icon: Icon(
                                Icons.keyboard_double_arrow_right_sharp,
                                size: 24,
                                color: AppColor.secondPageIconColor,
                              ),
                              onPressed: () {}))
                    ]))));
  }
}

class ListCard extends StatelessWidget {
  final Function press;
  final String avatarPath;
  final String name;
  final String inform;

  const ListCard({
    super.key,
    required this.press,
    required this.avatarPath,
    required this.name,
    required this.inform,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.homePageContainerTextSmall,
            borderRadius: const BorderRadius.all(
              Radius.circular(25.0),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColor.homePageContainerTextSmall
                    .withOpacity(0.2), // Set the shadow color
                offset: const Offset(0, 5), // Set the shadow offset
                blurRadius: 10, // Set the shadow blur radius
                spreadRadius: 4,
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width / 1.1,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.9), width: 2),
                  color: AppColor.gradientFirst.withOpacity(0.8),
                ),
                child: ClipOval(
                  child: Image.asset(
                    avatarPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text(
                          name,
                          style: AppDesign.listCardName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(
                        inform,
                        style: AppDesign.listCardInf2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.gradientFirst.withOpacity(0.12),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                margin: const EdgeInsets.only(right: 16),
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_double_arrow_right_sharp,
                    size: 24,
                    color: AppColor.gradientFirst.withOpacity(0.8),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String exerciseName;
  final String exerciseImagePath;
  final String exerciseInformation;
  final Function onClickEx;

  const ExerciseCard(
      {super.key,
      required this.exerciseName,
      required this.exerciseInformation,
      required this.exerciseImagePath,
      required this.onClickEx});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onClickEx();
        },
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                decoration: BoxDecoration(
                    color: AppColor.secondPageContainerGradient2ndColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.secondPageContainerGradient2ndColor
                              .withOpacity(0.25), // Set the shadow color
                          offset: const Offset(0, 5), // Set the shadow offset
                          blurRadius: 10, // Set the shadow blur radius
                          spreadRadius: 10)
                    ]),
                width: MediaQuery.of(context).size.width / 1.1,
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 4,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                              ),
                              child: Image.asset(exerciseImagePath,
                                  fit: BoxFit.cover))),
                      Flexible(
                          child: Container(
                              margin:
                                  const EdgeInsets.only(right: 16, left: 16),
                              child: Column(children: [
                                Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: Text(exerciseName,
                                        style: AppDesign.cardName,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2)),
                                Text(exerciseInformation,
                                    style: AppDesign.cardDescription,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2)
                              ]))),
                      Container(
                          decoration: BoxDecoration(
                              color: AppColor.secondPageIconColor
                                  .withOpacity(0.25),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(10.0))),
                          margin: const EdgeInsets.only(right: 16),
                          child: IconButton(
                              icon: Icon(Icons.add,
                                  size: 24,
                                  color: AppColor.secondPageIconColor),
                              onPressed: onClickEx()))
                    ]))));
  }
}

class ExerciseCard2 extends StatelessWidget {
  final String exerciseName;
  final String exerciseImagePath;
  final String exerciseInformation;
  final Function onClickEx;

  const ExerciseCard2(
      {super.key,
      required this.exerciseName,
      required this.exerciseInformation,
      required this.exerciseImagePath,
      required this.onClickEx});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onClickEx();
        },
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                decoration: BoxDecoration(
                    color: AppColor.secondPageContainerGradient2ndColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.secondPageContainerGradient2ndColor
                              .withOpacity(0.25), // Set the shadow color
                          offset: const Offset(0, 5), // Set the shadow offset
                          blurRadius: 10, // Set the shadow blur radius
                          spreadRadius: 10)
                    ]),
                width: MediaQuery.of(context).size.width / 1.1,
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 5,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                              ),
                              child: Image.asset(exerciseImagePath,
                                  fit: BoxFit.cover))),
                      Flexible(
                          child: Container(
                              margin: const EdgeInsets.only(
                                right: 16,
                                left: 16,
                              ),
                              child: Column(children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    top: 8,
                                  ),
                                  child: Text(exerciseName,
                                      style: AppDesign.cardName,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2),
                                ),
                                Text(
                                  exerciseInformation,
                                  style: AppDesign.cardDescription,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                )
                              ])))
                    ]))));
  }
}

class TextFieldDemo extends StatelessWidget {
  final double fieldWidth;
  final String fieldName;

  const TextFieldDemo({
    super.key,
    required this.fieldWidth,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: fieldWidth,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: fieldName,
          labelStyle: TextStyle(
            color: AppColor.gradientFirst,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            // Border when the field is focused
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: AppColor.gradientFirst),
          ),
        ),
        onSaved: (value) {},
      ),
    );
  }
}

class DropFeild extends StatelessWidget {
  final double dropListWidth;
  final String dropListName;
  final String selectedItem;

  const DropFeild({
    Key? key,
    required this.dropListWidth,
    required this.dropListName,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 28,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: dropListName,
          contentPadding: const EdgeInsets.all(12),
          border: const OutlineInputBorder(),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isDense: true,
            value: selectedItem,
            onChanged: (newValue) {},
            items: ['Male', 'Female'].map((String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 28,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Gender',
          labelStyle: TextStyle(
            color: AppColor.gradientFirst,
          ),
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: AppColor.gradientFirst),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedGender,
            isDense: true,
            onChanged: (newValue) {
              setState(() {
                selectedGender = newValue;
              });
            },
            items: ['Male', 'Female'].map((String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class MaritalStatus extends StatefulWidget {
  const MaritalStatus({Key? key}) : super(key: key);

  @override
  State<MaritalStatus> createState() => MaritalStatusState();
}

class MaritalStatusState extends State<MaritalStatus> {
  String? selectedStutus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 28,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Marital Status',
          labelStyle: TextStyle(
            color: AppColor.gradientFirst,
          ),
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: AppColor.gradientFirst),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedStutus,
            isDense: true,
            onChanged: (newValue) {
              setState(() {
                selectedStutus = newValue;
              });
            },
            items: ['Single', 'Married', 'Divorced', 'Widowed']
                .map((String status) {
              return DropdownMenuItem<String>(
                value: status,
                child: Text(status),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
