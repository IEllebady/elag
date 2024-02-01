import 'package:elag/constants/syles.dart';
import 'package:elag/controller/cubit/layout_cubit.dart';
import 'package:elag/therapists/therapist_exercies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientsListScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  PatientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutCubit = BlocProvider.of<LayoutCubit>(context)
      ..getPatient()
      ..getTherapist()
      ..getUsersData();

    return BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {
          if( state is FilterPatientForUserLoadingState) {
            const CircularProgressIndicator();
          } else if( state is DoctorAcceptPatientLoadingState)
            const CircularProgressIndicator();
          else print(state);
        },
        builder: (context, state) {
          return Scaffold(
              key: scaffoldKey,
              drawer: Drawer(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    if (layoutCubit.userModel != null)
                      UserAccountsDrawerHeader(
                          accountName: Text(layoutCubit.userModel!.name!),
                          accountEmail: Text(layoutCubit.userModel!.email!),
                          currentAccountPicture: CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(layoutCubit.userModel!.image!))),
                    const Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          ListTile(
                              leading: Icon(Icons.logout),
                              title: Text("Log out"))
                        ]))
                  ])),
              appBar: AppBar(
                  title: layoutCubit.searchPatientEnabled
                      ? TextField(
                          style: const TextStyle(color: Colors.white),
                          onChanged: (input) {
                            layoutCubit.searchAboutPatient(query: input);
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search about Patient....',
                              hintStyle: TextStyle(color: Colors.white)))
                      : GestureDetector(
                          child: const Text("Patients"),
                          onTap: () {
                            scaffoldKey.currentState!.openDrawer();
                          }),
                  actions: [
                    Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                            child: Icon(layoutCubit.searchPatientEnabled
                                ? Icons.clear
                                : Icons.search),
                            onTap: () {
                              layoutCubit.changeSearchPatientStatus();
                            }))
                  ],
                  automaticallyImplyLeading: false,
                  elevation: 0),
              body: state is FilterPatientForUserLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  :  Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                    itemCount: layoutCubit.patientsFiltered.isEmpty
                                        ? layoutCubit.patient.length
                                        : layoutCubit.patientsFiltered.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 18),
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) {
                                              return TherapistsExercies(
                                                  userModel: layoutCubit
                                                          .patientsFiltered.isEmpty
                                                      ? layoutCubit.patient[index]
                                                      : layoutCubit
                                                          .patientsFiltered[index]);
                                            }));
                                          },
                                          contentPadding: EdgeInsets.zero,
                                          leading: CircleAvatar(
                                              radius: 35,
                                              backgroundImage: NetworkImage(
                                                  layoutCubit.patientsFiltered.isEmpty
                                                      ? layoutCubit
                                                          .patient[index].image!
                                                      : layoutCubit
                                                          .patientsFiltered[index]
                                                          .image!)),
                                          title: Text(
                                              layoutCubit.patientsFiltered.isEmpty
                                                  ? layoutCubit.patient[index].name!
                                                  : layoutCubit
                                                      .patientsFiltered[index]
                                                      .name!));
                                    }),
                                const SizedBox(height: 24,),
                                const Text("Patient requests"),
                                const SizedBox(height: 24,),
                                layoutCubit.patientPending.isNotEmpty?Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    child: ListView.separated(
                                        physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                        itemCount: layoutCubit.patientPending.length,
                                        separatorBuilder: (context, index) =>
                                        const SizedBox(height: 18),
                                        itemBuilder: (context, index) {
                                          return SizedBox(
                                            height: 60,
                                            width: double.infinity,
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                    radius: 35,
                                                    backgroundImage: NetworkImage(
                                                        layoutCubit.patientPending[index]
                                                            .image!)),
                                                const SizedBox( width:24),
                                                Text(layoutCubit.patientPending[index]
                                                    .name!),

                                                const Spacer(),
                                                InkWell(onTap: (){
                                                  layoutCubit.doctorAcceptPatient(index);

                                                }, child: Container(alignment: Alignment.center,
                                                    decoration: const BoxDecoration(
                                                      color: AppColor.lightBlue,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: const Icon(Icons.done))),
                                                const SizedBox( width:24),
                                                InkWell(onTap:(){
                                                  layoutCubit.doctorRejectPatient(index);
                                                }, child: Container(alignment: Alignment.center,
                                                    decoration: const BoxDecoration(
                                                      color: AppColor.primaryColor,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: const Icon(Icons.clear))),

                                              ],
                                            ),
                                          );
                                        })):
                                const Center(child: Text("There is no Patients request yet")
                                ),
                              ],
                            ),
                          ))
          );
        });
  }
}
