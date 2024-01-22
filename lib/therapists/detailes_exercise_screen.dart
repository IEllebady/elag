// import 'package:elag/Models/exrecies_model.dart';
// import 'package:elag/constants/syles.dart';
// import 'package:elag/controller/cubit/layout_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DetailesExerciseScreen extends StatelessWidget {
//   final ExerciseModel exerciseModel;
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   DetailesExerciseScreen({super.key, required this.exerciseModel});

//   @override
//   Widget build(BuildContext context) {
//     final layoutCubit = BlocProvider.of<LayoutCubit>(context)
//       ..getExreciesList();

//     return BlocConsumer<LayoutCubit, LayoutState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return PageView.builder(
//               itemCount: layoutCubit.exrecises.length,
//               itemBuilder: (context, index) {
//                 return Center(
//                     child: Card(
//                         child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 12.0, horizontal: 8),
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   Image.network(
//                                       layoutCubit.exrecises[index].image!),
//                                   Text(layoutCubit.exrecises[index].title!),
//                                   Text(layoutCubit.exrecises[index].body!),
//                                   Text(layoutCubit.exrecises[index].steps!),
//                                   Container(
//                                       margin: const EdgeInsets.symmetric(
//                                           vertical: 10),
//                                       child: TextButton(
//                                           onPressed: () {},
//                                           style: ButtonStyle(
//                                               backgroundColor:
//                                                   MaterialStateProperty.all(
//                                                       AppColor.mainBlue),
//                                               tapTargetSize: MaterialTapTargetSize
//                                                   .shrinkWrap,
//                                               minimumSize: MaterialStateProperty.all(
//                                                   const Size(
//                                                       double.infinity, 52)),
//                                               shape: MaterialStateProperty.all(
//                                                   RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(16)))),
//                                           child: Text('Next', style: TextStyles.font16WhiteSemiBold)))
//                                 ]))));
//               });
//         });
//   }
// }
import 'package:elag/Models/exrecies_model.dart';
import 'package:elag/controller/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailesExerciseScreen extends StatelessWidget {
  final ExerciseModel exerciseModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  DetailesExerciseScreen({super.key, required this.exerciseModel});

  @override
  Widget build(BuildContext context) {
    final layoutCubit = BlocProvider.of<LayoutCubit>(context)
      ..getExreciesList();

    return BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return PageView.builder(
              itemCount: layoutCubit.exerciseMessage.length,
              itemBuilder: (context, index) {
                return Center(
                    child: Card(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.network(layoutCubit
                                      .exerciseMessage[index].image!),
                                  Text(layoutCubit
                                      .exerciseMessage[index].title!),
                                  Text(
                                      layoutCubit.exerciseMessage[index].body!),
                                  //Text(layoutCubit
                                  //.exerciseMessage[index].steps!),
                                  // Container(
                                  //     margin: const EdgeInsets.symmetric(
                                  //         vertical: 10),
                                  //     child: TextButton(
                                  //         onPressed: () {},
                                  //         style: ButtonStyle(
                                  //             backgroundColor:
                                  //                 MaterialStateProperty.all(
                                  //                     AppColor.mainBlue),
                                  //             tapTargetSize: MaterialTapTargetSize
                                  //                 .shrinkWrap,
                                  //             minimumSize: MaterialStateProperty.all(
                                  //                 const Size(
                                  //                     double.infinity, 52)),
                                  //             shape: MaterialStateProperty.all(
                                  //                 RoundedRectangleBorder(
                                  //                     borderRadius:
                                  //                         BorderRadius.circular(16)))),
                                  //         child: Text('Next', style: TextStyles.font16WhiteSemiBold)))
                                ]))));
              });
        });
  }
}
