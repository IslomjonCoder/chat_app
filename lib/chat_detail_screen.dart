import 'package:chat_app/database.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/powersync.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:gap/gap.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key, required this.chat});

  final Chat chat;

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List<MessageWithReadStatus> messages = [];

  @override
  void initState() {
    fetchMessages();
    // initializeRealtime();
    super.initState();
  }

  // void initializeRealtime() {
  //   supabase.from('messages').stream(primaryKey: ['message_id']).eq('chat_id', widget.chat.id).listen(
  //         (data) {
  //           final messagesList = data.map((e) => MessageModel.fromJson(e)).toList();
  //           setState(() => messages = messagesList);
  //         },
  //       );
  // }

  void fetchMessages() async {
    appDb.getMessagesWithReadStatusByChatId(widget.chat.id).listen((data) {
      setState(() => messages = data);
    });
    // print(response);
    // setState(() => messages = response);
    // appDb.watchMessagesByChatId(widget.chat.id).listen((data) {
    //   setState(() => messages = data);
    // });
    // final messageModels = response.map((e) => MessageModel.fromJson(e)).toList();
    // setState(() => messages = messageModels);
  }

  void sendMessage() async {
    // chat_id, sender_id, content, message_type
    final Map<String, dynamic> message = {
      'chat_id': widget.chat.id,
      'sender_id': supabase.auth.currentUser!.id,
      'content': textController.text.trim(),
      'message_type': 'text',
    };
    appDb
        .insertMessage(
          MessagesCompanion.insert(
            chatId: widget.chat.id,
            senderId: supabase.auth.currentUser!.id,
            content: textController.text.trim(),
            messageType: 'text',
            createdAt: drift.Value(DateTime.now()),
          ),
        )
        .then((_) => fetchMessages());

    textController.clear();
    // await supabase.from('messages').insert(message).whenComplete(() => fetchMessages());
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  void markAsRead(MessageWithReadStatus message) async {
    final userId = supabase.auth.currentUser!.id;
    if (message.message.senderId == userId || message.profiles.any((e) => e.id == userId)) {
      return;
    }
    appDb.markMessageAsRead(message.message.id, userId);
    // appDb
    // message_id, user_id, is_read
    // final Map<String, dynamic> messageReadStatus = {
    //   'is_read': true,
    //   'user_id': supabase.auth.currentUser!.id,
    //   'message_id': message.message.id,
    // };
    // await supabase.from('message_read_status').insert(messageReadStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.chat.chatName!)),
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final message = messages[index];

                  final bool isMe = supabase.auth.currentUser!.id == message.message.senderId;
                  final bool isRead = message.profiles.any((e) => e.id != supabase.auth.currentUser!.id);
                  markAsRead(message);
                  return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!isMe) ...[
CircleAvatar(
  child: Text(
    message.profiles.first.username.substring(0, 1),
  ),
),
                              const Gap(8),
                            ],
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: isMe ? const Color(0xFF101010) : const Color(0xFFF7F8F9),
                              ),
                              child: Column(
                                children: [
                                  // Text(),
                                  Text(
                                    message.message.content,
                                    style: TextStyle(color: isMe ? Colors.white : Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Gap(8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(DateFormat('HH:mm').format(message.message.createdAt)),
                            if (isMe) const Gap(4),
                            if (isMe) isRead ? const Icon(Icons.done_all) : const Icon(Icons.done),
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: messages.length,
              ),
            ),
            TextField(
              controller: textController,
              onSubmitted: (value) => sendMessage(),
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write a message',
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: TextField(
      //   controller: textController,
      //   onSubmitted: (value) => sendMessage(),
      //   onTapOutside: (event) => FocusScope.of(context).unfocus(),
      //   decoration: const InputDecoration(
      //     border: OutlineInputBorder(),
      //     hintText: 'Write a message',
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //   // final response = await appDb.getMessagesWithReadStatusByChatId(widget.chat.id);
      //   // print(response);
      //   final response = await supabase.from('messages').select('*,message_read_status(*, profile(*))');
      //   print(response);
      // }),
    );
  }
}
