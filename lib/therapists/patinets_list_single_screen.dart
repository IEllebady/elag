import 'package:elag/controller/cubit/layout_cubit.dart';
import 'package:elag/patients/evrey_single_patient_program.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientsListSingleScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  PatientsListSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutCubit = BlocProvider.of<LayoutCubit>(context)
      ..getPatient()
      ..getTherapist()
      ..getUsersData();

    return BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
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
              body: state is GetPatientsLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : layoutCubit.patient.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: ListView.separated(
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
                                        return SinglePatientProgram(
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
                              }))
                      : const Center(child: Text("There is no Patients yet")));
        });
  }
}
