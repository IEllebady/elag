import 'package:elag/Models/user_model.dart';
import 'package:elag/constants/syles.dart';
import 'package:elag/controller/cubit/layout_cubit.dart';
import 'package:elag/therapists/detailes_exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TherapistsExercies extends StatelessWidget {
  final UserModel userModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TherapistsExercies({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layoutCubit = BlocProvider.of<LayoutCubit>(context)
      ..getExreciesData()
      ..getExreciesList();

    List<String> selectedItems = [];

    return BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: layoutCubit.searchEnabled
                    ? TextField(
                        style: const TextStyle(color: Colors.white),
                        onChanged: (input) {
                          layoutCubit.searchAboutExercise(query: input);
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search about Exercise....',
                            hintStyle: TextStyle(color: Colors.white)))
                    : GestureDetector(
                        child: const Text("Exercises"),
                        onTap: () {
                          scaffoldKey.currentState!.openDrawer();
                        }),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GestureDetector(
                      child: Icon(layoutCubit.searchEnabled
                          ? Icons.clear
                          : Icons.search),
                      onTap: () {
                        layoutCubit.changeSearchStatus();
                      },
                    ),
                  )
                ],
                automaticallyImplyLeading: false,
                elevation: 0,
              ),
              body: state is GetUsersLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : layoutCubit.exrecises.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 8),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                    child: ListView.separated(
                                        itemCount: layoutCubit.exrecises.isEmpty
                                            ? layoutCubit.exrecises.length
                                            : layoutCubit.exrecises.length,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(height: 18),
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                              onTap: () {
                                                Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                  return DetailesExerciseScreen(
                                                      exerciseModel: layoutCubit
                                                              .exrecises.isEmpty
                                                          ? layoutCubit
                                                              .exrecises[index]
                                                          : layoutCubit
                                                                  .exrecises[
                                                              index]);
                                                }));

                                                // for (int i = 0;
                                                //     i <
                                                //         layoutCubit.exrecises
                                                //             .length;i++){}
                                                switch (index) {
                                                  case 0:
                                                    const ();

                                                    break;
                                                  case 1:
                                                    print('Tapped on Item 2');
                                                    break;
                                                  case 2:
                                                    print('Tapped on Item 3');
                                                    break;
                                                  case 3:
                                                    print('Tapped on Item 4');
                                                    break;
                                                  default:
                                                    break;
                                                }
                                              },
                                              contentPadding: EdgeInsets.zero,
                                              leading: CircleAvatar(
                                                  radius: 35,
                                                  backgroundImage: NetworkImage(
                                                      layoutCubit.usersFiltered
                                                              .isEmpty
                                                          ? layoutCubit
                                                              .exrecises[index]
                                                              .image!
                                                          : layoutCubit
                                                              .exrecises[index]
                                                              .image!)),
                                              title: Text(layoutCubit
                                                      .usersFiltered.isEmpty
                                                  ? layoutCubit
                                                      .exrecises[index].title!
                                                  : layoutCubit
                                                      .exrecises[index].title!),
                                              subtitle: Text(layoutCubit
                                                      .usersFiltered.isEmpty
                                                  ? layoutCubit
                                                      .exrecises[index].body!
                                                  : layoutCubit
                                                      .exrecises[index].body!),
                                              trailing: Checkbox(
                                                  value: layoutCubit.isSelected[index],
                                                  onChanged: (value) {
                                                    //setState(() {
                                                   layoutCubit.checkboxIsSelected(value!, index);
                                                    selectedItems.clear();
                                                    //});
                                                  }));
                                        })),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: TextButton(
                                        onPressed: () async {
                                          // for (int i = 0;
                                          //     i < isSelected.length;
                                          //     i++) {
                                          //   if (isSelected[i]) {}
                                          // }
                                          await layoutCubit.deleteExerciseCollection( userModel.id!).then((value){
                                            for (int i = 0;
                                            i < layoutCubit.exrecises.length;
                                            i++) {
                                              if (layoutCubit.isSelected[i] == true) {
                                                print("addd");
                                                layoutCubit.sendExercise(index: i,
                                                    title: layoutCubit
                                                        .exrecises[i].title!,
                                                    receiverID: userModel.id!,
                                                    body: layoutCubit
                                                        .exrecises[i].body!,
                                                    image: layoutCubit
                                                        .exrecises[i].image!);
                                              }
                                          }
                                          });

                                          }
                                        ,
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColor.mainBlue),
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                            minimumSize:
                                                MaterialStateProperty.all(
                                              const Size(double.infinity, 52),
                                            ),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)))),
                                        child: Text('Share Now',
                                            style: TextStyles
                                                .font16WhiteSemiBold)))
                              ]))
                      : const Center(child: Text("There is no Exercise yet")));
        });
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:elag/Models/user_model.dart';
// import 'package:elag/constants/syles.dart';
// import 'package:elag/controller/cubit/layout_cubit.dart';
// import 'package:elag/therapists/detailes_exercise_screen.dart';

// class TherapistsExercies extends StatefulWidget {
//   final UserModel userModel;

//   TherapistsExercies({Key? key, required this.userModel}) : super(key: key);

//   @override
//   _TherapistsExerciesState createState() => _TherapistsExerciesState();
// }

// class _TherapistsExerciesState extends State<TherapistsExercies> {
//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     final layoutCubit = BlocProvider.of<LayoutCubit>(context)
//       ..getExreciesData()
//       ..getExreciesList();
//     List<bool> isSelected = List.generate(9999999, (index) => false);
//     //List<bool> isSelected =
//     //  List.generate(layoutCubit.exrecises.length, (index) => false);

//     List<int> selectedIndexes = [];

//     return BlocConsumer<LayoutCubit, LayoutState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           key: scaffoldKey,
//           appBar: AppBar(
//             title: layoutCubit.searchEnabled
//                 ? TextField(
//                     style: const TextStyle(color: Colors.white),
//                     onChanged: (input) {
//                       layoutCubit.searchAboutExercise(query: input);
//                     },
//                     decoration: const InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Search about Exercise....',
//                         hintStyle: TextStyle(color: Colors.white)))
//                 : GestureDetector(
//                     child: const Text("Exercises"),
//                     onTap: () {
//                       scaffoldKey.currentState!.openDrawer();
//                     }),
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 12.0),
//                 child: GestureDetector(
//                   child: Icon(
//                       layoutCubit.searchEnabled ? Icons.clear : Icons.search),
//                   onTap: () {
//                     layoutCubit.changeSearchStatus();
//                   },
//                 ),
//               )
//             ],
//             automaticallyImplyLeading: false,
//             elevation: 0,
//           ),
//           body: state is GetUsersLoadingState
//               ? const Center(child: CircularProgressIndicator())
//               : layoutCubit.exrecises.isNotEmpty
//                   ? Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 12.0, horizontal: 8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.max,
//                         children: [
//                           Expanded(
//                             child: ListView.separated(
//                               itemCount: layoutCubit.exrecises.isEmpty
//                                   ? layoutCubit.exrecises.length
//                                   : layoutCubit.exrecises.length,
//                               separatorBuilder: (context, index) =>
//                                   const SizedBox(height: 18),
//                               itemBuilder: (context, index) {
//                                 return ListTile(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) {
//                                           return DetailesExerciseScreen(
//                                             exerciseModel: layoutCubit
//                                                     .exrecises.isEmpty
//                                                 ? layoutCubit.exrecises[index]
//                                                 : layoutCubit.exrecises[index],
//                                           );
//                                         },
//                                       ),
//                                     );
//                                   },
//                                   contentPadding: EdgeInsets.zero,
//                                   leading: CircleAvatar(
//                                     radius: 35,
//                                     backgroundImage: NetworkImage(
//                                       layoutCubit.usersFiltered.isEmpty
//                                           ? layoutCubit.exrecises[index].image!
//                                           : layoutCubit.exrecises[index].image!,
//                                     ),
//                                   ),
//                                   title: Text(
//                                     layoutCubit.usersFiltered.isEmpty
//                                         ? layoutCubit.exrecises[index].title!
//                                         : layoutCubit.exrecises[index].title!,
//                                   ),
//                                   subtitle: Text(
//                                     layoutCubit.usersFiltered.isEmpty
//                                         ? layoutCubit.exrecises[index].body!
//                                         : layoutCubit.exrecises[index].body!,
//                                   ),
//                                   trailing: Checkbox(
//                                     value: isSelected[index],
//                                     onChanged: (value) {
//                                       setState(() {
//                                         isSelected[index] = value ?? false;
//                                         //selectedItems.clear();
//                                       });
//                                     },
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                           Container(
//                             margin: const EdgeInsets.symmetric(vertical: 10),
//                             child: TextButton(
//                               onPressed: () {
//                                 for (int i = 0;
//                                     i < layoutCubit.exrecises.length;
//                                     i++) {
//                                   if (isSelected[i] == true) {
//                                     layoutCubit.sendExercise(
//                                       title: layoutCubit.exrecises[i].title!,
//                                       receiverID: widget.userModel.id!,
//                                       body: layoutCubit.exrecises[i].body!,
//                                       image: layoutCubit.exrecises[i].image!,
//                                     );
//                                   }
//                                 }
//                               },
//                               style: ButtonStyle(
//                                 backgroundColor: MaterialStateProperty.all(
//                                     AppColor.mainBlue),
//                                 tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                 minimumSize: MaterialStateProperty.all(
//                                   const Size(double.infinity, 52),
//                                 ),
//                                 shape: MaterialStateProperty.all(
//                                   RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(16),
//                                   ),
//                                 ),
//                               ),
//                               child: Text(
//                                 'Share Now',
//                                 style: TextStyles.font16WhiteSemiBold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   : const Center(child: Text("There is no Exercise yet")),
//         );
//       },
//     );
//   }
// }
