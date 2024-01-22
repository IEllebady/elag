// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:elag/Models/user_model.dart';
// import 'package:elag/controller/cubit/layout_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SinglePatientProgram extends StatefulWidget {
//   final UserModel userModel;

//   SinglePatientProgram({Key? key, required this.userModel}) : super(key: key);

//   @override
//   _PatientExerciesScreenState createState() => _PatientExerciesScreenState();
// }

// class _PatientExerciesScreenState extends State<SinglePatientProgram> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     final cubit = BlocProvider.of<LayoutCubit>(context)
//       ..getExercise(receiverID: widget.userModel.id!);

//     return Scaffold(
//         appBar: AppBar(
//           title: Text(widget.userModel.name!),
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
//                   child: state is GetMessagesLoadingState
//                       ? const Center(child: CircularProgressIndicator())
//                       : cubit.exerciseMessage.isNotEmpty
//                           ? ListView.builder(
//                               itemCount: cubit.exerciseMessage.length,
//                               itemBuilder: (context, index) {
//                                 return ListTile(
//                                     onTap: () {},
//                                     contentPadding: EdgeInsets.zero,
//                                     leading: CircleAvatar(
//                                       radius: 35,
//                                       backgroundImage: NetworkImage(
//                                         cubit.exerciseMessage[index].image!,
//                                       ),
//                                     ),
//                                     title: Text(
//                                       cubit.exerciseMessage[index].title!,
//                                     ),
//                                     subtitle: Text(
//                                       cubit.exerciseMessage[index].body!,
//                                     ),
//                                     trailing: IconButton(
//                                       icon: const Icon(Icons.cancel),
//                                       onPressed: () {
//                                         _removeExerciseMessage(index,
//                                             cubit.exerciseMessage[index]);
//                                       },
//                                     ));
//                               })
//                           : const Center(child: Text("No Exercises yet......")),
//                 ),
//                 const SizedBox(height: 12),
//               ]));
//         }));
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:elag/Models/user_model.dart';
import 'package:elag/controller/cubit/layout_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SinglePatientProgram extends StatefulWidget {
  final UserModel userModel;

  SinglePatientProgram({Key? key, required this.userModel}) : super(key: key);

  @override
  _PatientExerciesScreenState createState() => _PatientExerciesScreenState();
}

class _PatientExerciesScreenState extends State<SinglePatientProgram> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context)
      ..getExercise(receiverID: widget.userModel.id!);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.userModel.name!),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body:
            BlocConsumer<LayoutCubit, LayoutState>(listener: (context, state) {
          if (state is SuccessPatientSendMessageState) {
            // Handle success state if needed
          }
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
                                    backgroundImage: NetworkImage(
                                      cubit.exerciseMessage[index].image!,
                                    ),
                                  ),
                                  title: Text(
                                    cubit.exerciseMessage[index].title!,
                                  ),
                                  subtitle: Text(
                                    cubit.exerciseMessage[index].body!,
                                  ),
                                  trailing: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        cubit.exerciseMessage[index].isHidden =
                                            cubit.exerciseMessage[index]
                                                .isHidden;
                                      });
                                    },
                                    child: Icon(Icons.cancel),
                                  ),
                                );
                              })
                          : const Center(child: Text("No Exercises yet......")),
                ),
                const SizedBox(height: 12),
              ]));
        }));
  }
}
