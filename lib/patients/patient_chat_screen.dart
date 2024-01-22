import 'package:elag/Models/user_model.dart';
import 'package:elag/controller/cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientChatScreen extends StatelessWidget {
  final UserModel userModel;
  final messageController = TextEditingController();

  PatientChatScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LayoutCubit>(context)
      ..getMessages(receiverID: userModel.id!);

    return Scaffold(
        appBar: AppBar(
            title: Text(userModel.name!),
            leading:
                CircleAvatar(backgroundImage: NetworkImage(userModel.image!)),
            elevation: 0,
            automaticallyImplyLeading: false),
        body:
            BlocConsumer<LayoutCubit, LayoutState>(listener: (context, state) {
          if (state is SuccessPatientSendMessageState) {
            messageController.clear();
          }
        }, builder: (context, state) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/whatsapp_Back.png"),
                      fit: BoxFit.cover)),
              child: Column(children: [
                Expanded(
                    child: state is GetMessagesLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : cubit.messages.isNotEmpty
                            ? ListView.builder(
                                itemCount: cubit.messages.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (index >= 0 &&
                                          index < cubit.messages.length) {
                                        cubit.messages.removeAt(0);
                                        print('masseges is deleated ');

                                        // Emit a new state with the updated list
                                      }
                                    },
                                    child: Container(
                                        color: Colors.blueGrey,
                                        margin:
                                            const EdgeInsets.only(bottom: 15),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 12),
                                        child: Text(
                                            cubit.messages[index].title!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18))),
                                  );
                                })
                            : const Center(
                                child: Text("No Messages yet......"))),
                const SizedBox(height: 12),
                TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            child: const Icon(Icons.send),
                            onTap: () {
                              cubit.sendMessage(
                                  message: messageController.text,
                                  receiverID: userModel.id!);
                            }),
                        border: const OutlineInputBorder()))
              ]));
        }));
  }
}
