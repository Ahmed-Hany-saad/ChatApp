// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/constants.dart';

import '../models/messages.dart';
import '../widgets/chatBubble.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);
  static String id = "chatApp";

  @override
  Widget build(BuildContext context) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection('Messages');
    final screenWidth = MediaQuery.of(context).size.width;
    // ignore: no_leading_underscores_for_local_identifiers
    final ScrollController _controller = ScrollController();
    TextEditingController controller = TextEditingController();
    String email = ModalRoute.of(context)!.settings.arguments as String;

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdate', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessagesModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessagesModel.fromJson(
                snapshot.data!.docs[i].data() as Map<String, dynamic>));
          }
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 222, 222, 222),
            appBar: AppBar(
              toolbarHeight: screenWidth * 0.19,
              backgroundColor: KPrimarycolor,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    height: screenWidth * 0.18,
                  ),
                  Text(
                    "Chat App",
                    style: TextStyle(fontSize: screenWidth * 0.07),
                  ),
                ],
              ),
            ),
            body: SizedBox(
              height: screenWidth * 2,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        if (messagesList[index].id == email) {
                          return ChatBubble(messages: messagesList[index]);
                        } else {
                          return ChatBubblefriend(
                              messages: messagesList[index]);
                        }
                      },
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: screenWidth * 0.03,
                        bottom: screenWidth * 0.03,
                        end: screenWidth * 0.05,
                        start: screenWidth * 0.03,
                      ),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          _sendMessage(
                              messages, data, email, controller, _controller);
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(screenWidth * 0.044),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.send,
                              color: KPrimarycolor,
                            ),
                            onPressed: () {
                              _sendMessage(messages, controller.text, email,
                                  controller, _controller);
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 4, 139, 206)),
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.05),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 1, 173, 7)),
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.05),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 1, 129, 134)),
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.05),
                          ),
                          hintText: "Send Message",
                        ),
                        style: TextStyle(fontSize: screenWidth * 0.06),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 222, 222, 222),
            appBar: AppBar(
              toolbarHeight: screenWidth * 0.19,
              backgroundColor: KPrimarycolor,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    height: screenWidth * 0.18,
                  ),
                  Text(
                    "Chat App",
                    style: TextStyle(fontSize: screenWidth * 0.07),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  void _sendMessage(CollectionReference messages, String message, String email,
      TextEditingController controller, ScrollController scrollController) {
    if (message.trim().isNotEmpty) {
      messages.add({
        'message': message,
        'createdate': DateTime.now(),
        'id': email,
      });
      controller.clear();
      scrollController.animateTo(
        0,
        duration: const Duration(seconds: 2),
        curve: Curves.decelerate,
      );
    }
  }
}
