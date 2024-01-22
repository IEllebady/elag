// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Language extends GetView<LocalController> {
//   const Language({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Choose Language".tr,
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             CustomButtonLang(
//                 text_button: "Ar",
//                 onPressed: () {
//                   controller.changeLang("ar");
//                   Get.toNamed(AppRoute.onBoarding);
//                 }),
//             CustomButtonLang(
//                 text_button: "En",
//                 onPressed: () {
//                   controller.changeLang("en");
//                   Get.toNamed(AppRoute.onBoarding);
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
