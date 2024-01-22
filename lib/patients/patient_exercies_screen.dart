import 'package:elag/Models/user_model.dart';
import 'package:elag/controller/cubit/layout_cubit.dart';
import 'package:elag/therapists/detailes_exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientExerciesScreen extends StatelessWidget {
  final UserModel userModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PatientExerciesScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context)
      ..getExercise(receiverID: userModel.id!);
    final layoutCubit = BlocProvider.of<LayoutCubit>(context)
      ..getExreciesData()
      ..getExreciesList();
    return Scaffold(
        appBar: AppBar(
            title: Text(userModel.name!),
            elevation: 0,
            automaticallyImplyLeading: false),
        body:
            BlocConsumer<LayoutCubit, LayoutState>(listener: (context, state) {
          if (state is SuccessPatientSendMessageState) {}
        }, builder: (context, state) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(children: [
                Expanded(
                    child: state is GetMessagesLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : cubit.exerciseMessage.isNotEmpty
                            ? ListView.builder(
                                itemCount: cubit.exerciseMessage.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {},
                                    contentPadding: EdgeInsets.zero,
                                    leading: CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(cubit
                                            .exerciseMessage[index].image!)),
                                    title: Text(
                                        cubit.exerciseMessage[index].title!),
                                    subtitle: Text(
                                        cubit.exerciseMessage[index].body!),
                                    trailing: IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        // Remove the item when IconButton is pressed
                                        if (index >= 0 &&
                                            index <
                                                cubit.exerciseMessage.length) {
                                          // Remove the item from the list
                                          //cubit.removeExerciseMessage(index);
                                          if (index >= 0 &&
                                              index <
                                                  layoutCubit
                                                      .exerciseMessage.length) {
                                            layoutCubit.exerciseMessage
                                                .removeAt(index);
                                            //emit(YourStateUpdated(exerciseMessage)); // Replace YourStateUpdated with your actual state update logic
                                          }
                                        }
                                      },
                                    ),
                                  );
                                })
                            : const Center(
                                child: Text("No Exercises yet......"))),
                const SizedBox(height: 12)
              ]));
        }));
  }
}

                                    //     FloatingActionButton(
                                    //   onPressed: () {
                                    //     layoutCubit.exerciseMessage.removeAt(
                                    //         index); // Call the function to perform the close action
                                    //   },
                                    //   tooltip: 'Close',
                                    //   child: const Icon(Icons.close),
                                    // ),
                                    //  MaterialButton(
                                        //   onPressed: () {
                                        //     layoutCubit.exerciseMessage.removeAt(
                                        //         index); // Call the function to perform the close action
                                        //   },
                                        // )
                                        // floatingActionButton:

                                        ////////////////////////////


                                      //////////////////////////
                                    //   trailing: IconButton(
                                    //   icon: const Icon(Icons.remove),
                                    //   onPressed: () {
                                    //     if (index >= 0 &&
                                    //         index <
                                    //             layoutCubit
                                    //                 .exerciseMessage.length) {
                                    //       layoutCubit.exerciseMessage
                                    //           .removeAt(index);
                                    //       //layoutCubit.exerciseMessage
                                    //       //  .removeAt(index);
                                    //     }
                                    //   },
                                    // ),
// import 'package:elag/Models/user_model.dart';
// import 'package:elag/controller/cubit/layout_cubit.dart';
// import 'package:elag/therapists/detailes_exercise_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PatientExerciesScreen extends StatefulWidget {
//   final UserModel userModel;

//   PatientExerciesScreen({Key? key, required this.userModel}) : super(key: key);

//   @override
//   _PatientExerciesScreenState createState() => _PatientExerciesScreenState();
// }

// class _PatientExerciesScreenState extends State<PatientExerciesScreen> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     final cubit = BlocProvider.of<LayoutCubit>(context)
//       ..getExercise(receiverID: widget.userModel.id!);
//     final layoutCubit = BlocProvider.of<LayoutCubit>(context)
//       ..getExreciesData()
//       ..getExreciesList();

//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//               "DR ${layoutCubit.userModel!.name!} Create this program for you"),
//           elevation: 0,
//           automaticallyImplyLeading: false,
//         ),
//         body:
//             BlocConsumer<LayoutCubit, LayoutState>(listener: (context, state) {
//           if (state is SuccessPatientSendMessageState) {
//             // Handle success state if needed
//           }
//         }, builder: (context, state) {
//           return Container(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//               child: Column(children: [
//                 Expanded(
//                     child: state is GetMessagesLoadingState
//                         ? const Center(child: CircularProgressIndicator())
//                         : cubit.exerciseMessage.isNotEmpty
//                             ? ListView.builder(
//                                 itemCount: cubit.exerciseMessage.length,
//                                 itemBuilder: (context, index) {
//                                   return ListTile(
//                                       onTap: () {
//                                         const ();
//                                         Navigator.push(context,
//                                             MaterialPageRoute(
//                                                 builder: (context) {
//                                           return DetailesExerciseScreen(
//                                               exerciseModel: layoutCubit
//                                                       .exerciseMessage.isEmpty
//                                                   ? layoutCubit
//                                                       .exerciseMessage[index]
//                                                   : layoutCubit
//                                                       .exerciseMessage[index]);
//                                           // ExerciseScreen0();
//                                         }));
//                                       },
//                                       contentPadding: EdgeInsets.zero,
//                                       leading: CircleAvatar(
//                                           radius: 35,
//                                           backgroundImage: NetworkImage(cubit
//                                               .exerciseMessage[index].image!)),
//                                       title: Text(
//                                           cubit.exerciseMessage[index].title!),
//                                       subtitle: Text(
//                                           cubit.exerciseMessage[index].body!));
//                                 })
//                             : const Center(
//                                 child: Text("No Exercises yet......"))),
//                 const SizedBox(height: 12)
//               ]));
//         }));
//   }
// }
