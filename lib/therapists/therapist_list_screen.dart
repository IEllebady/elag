import 'package:elag/controller/cubit/layout_cubit.dart';
import 'package:elag/patients/patient_exercies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TherabistsListScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

   TherabistsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final layoutCubit = BlocProvider.of<LayoutCubit>(context)
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
                  title: layoutCubit.searchTherapistEnabled
                      ? TextField(
                          style: const TextStyle(color: Colors.white),
                          onChanged: (input) {
                            layoutCubit.searchAboutPatient(query: input);
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search about Therapist....',
                              hintStyle: TextStyle(color: Colors.white)))
                      : GestureDetector(
                          child: const Text("Therapists"),
                          onTap: () {
                            scaffoldKey.currentState!.openDrawer();
                          }),
                  actions: [
                    Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                            child: Icon(layoutCubit.searchTherapistEnabled
                                ? Icons.clear
                                : Icons.search),
                            onTap: () {
                              layoutCubit.changeSearchTherapistStatus();
                            }))
                  ],
                  automaticallyImplyLeading: false,
                  elevation: 0),
              body: state is GetTherabistsLoadingState
                  ? const Center(child: CircularProgressIndicator())
                  : layoutCubit.therapist.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: ListView.separated(
                              itemCount: layoutCubit.therapistsFiltered.isEmpty
                                  ? layoutCubit.therapist.length
                                  : layoutCubit.therapistsFiltered.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 18),
                              itemBuilder: (context, index) {
                                return ListTile(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return PatientExerciesScreen(
                                            userModel: layoutCubit
                                                    .therapistsFiltered.isEmpty
                                                ? layoutCubit.therapist[index]
                                                : layoutCubit
                                                    .therapistsFiltered[index]);
                                      }));
                                    },
                                    contentPadding: EdgeInsets.zero,
                                    leading: CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            layoutCubit
                                                    .therapistsFiltered.isEmpty
                                                ? layoutCubit
                                                    .therapist[index].image!
                                                : layoutCubit
                                                    .therapistsFiltered[index]
                                                    .image!)),
                                    title: Text(
                                        layoutCubit.therapistsFiltered.isEmpty
                                            ? layoutCubit.therapist[index].name!
                                            : layoutCubit
                                                .therapistsFiltered[index]
                                                .name!));
                              }))
                      : const Center(
                          child: Text("There is no Therapists yet")));
        });
  }
}
