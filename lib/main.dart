import 'package:elag/constants/constants.dart';
import 'package:elag/controller/cubit/layout_cubit.dart';
import 'package:elag/firebase_options.dart';
import 'package:elag/view/auth/cubit/auth_cubit.dart';
import 'package:elag/view/on_boarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPref = await SharedPreferences.getInstance();
  Constants.userID = sharedPref.getString('userID');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => LayoutCubit())
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home:
                //Constants.userID != null ? const HomeScreen() :
                OnboardingScreen()));
  }
}
