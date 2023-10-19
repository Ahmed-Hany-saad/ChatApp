// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/constants.dart';
import '../models/messages.dart';
import '../widgets/chatBubble.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);
  static String id = "chatApp";

  @override
  // ignore: library_private_types_in_public_api
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  final TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    CollectionReference messages =
        FirebaseFirestore.instance.collection('Messages777');
    final screenWidth = MediaQuery.of(context).size.width;
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right:
                            screenWidth * 0.02), // Adjust the value as needed
                    child: Row(
                      children: [
                        Image.network(
                          "https://cdn4.iconfinder.com/data/icons/avatar-circle-1-1/72/71-512.png",
                          width: screenWidth * 0.13,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Chat App  ",
                        style: TextStyle(fontSize: screenWidth * 0.06),
                      ),
                      SizedBox(
                        height: screenWidth * 0.008,
                      ),
                      Text(
                        " By Ahmed Hany",
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                IconButton(onPressed: () {}, icon:const Icon(Icons.call)),
                IconButton(onPressed: () {}, icon:const Icon(Icons.video_call)),
                IconButton(
                    onPressed: () {}, icon:const Icon(Icons.more_vert_outlined)),
              ],
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color:const Color(0xFFDEDEDE),
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                              top: screenWidth * 0.018,
                              bottom: screenWidth * 0.03,
                              end: screenWidth * 0.01,
                              start: screenWidth * 0.03,
                            ),
                            child: TextField(
                              controller: controller,
                              onSubmitted: (data) {
                                _sendMessage(messages, data, email, controller,
                                    _controller);
                              },
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.all(screenWidth * 0.044),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 4, 139, 206)),
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.05),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: KPrimarycolor),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: screenWidth * 0.024,
                          bottom: screenWidth * 0.01,
                          left: screenWidth * 0.014,
                        ),
                        child: CircleAvatar(
                          maxRadius: screenWidth * 0.07,
                          backgroundColor: KPrimarycolor,
                          child: IconButton(
                            onPressed: () {
                              _sendMessage(messages, controller.text, email,
                                  controller, _controller);
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: screenWidth * 0.085,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right:
                            screenWidth * 0.02), // Adjust the value as needed
                    child: Row(
                      children: [
                        Image.network(
                          "https://cdn4.iconfinder.com/data/icons/avatar-circle-1-1/72/71-512.png",
                          width: screenWidth * 0.13,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Chat App  ",
                        style: TextStyle(fontSize: screenWidth * 0.06),
                      ),
                      SizedBox(
                        height: screenWidth * 0.008,
                      ),
                      Text(
                        " By Ahmed Hany",
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                IconButton(onPressed: () {}, icon:const Icon(Icons.call)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.videocam),
                ),
                IconButton(
                  onPressed: () {},
                  icon:const Icon(Icons.more_vert_outlined),
                ),
              ],
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

  @override
  void dispose() {
    // Dispose of the TextEditingController when the widget is disposed.
    controller.dispose();
    super.dispose();
  }
}
