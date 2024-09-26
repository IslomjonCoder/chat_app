// {chat_id: 1, chat_name: Friends, chat_type: group, created_at: 2024-08-29T07:25:07.622272+00:00}
class ChatModel {
  final int chatId;
  final String chatName;
  final String chatType;
  final DateTime createdAt;

  const ChatModel({
    required this.chatId,
    required this.chatName,
    required this.chatType,
    required this.createdAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      chatId: json['chat_id'],
      chatName: json['chat_name'],
      chatType: json['chat_type'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}

// {message_id: 1, chat_id: 1, sender_id: 04c57bab-b486-4adc-995f-9f5616bb6129, content: Salom, message_type: text, created_at: 2024-08-29T09:02:53.785351+00:00, message_read_status: [{is_read: true, user_id: 52fc5611-d3e9-43c0-88db-d3f85f2d6bc3, created_at: 2024-08-29T09:31:34.895119+00:00, message_id: 1}]}

// class MessageModel {
//   final int messageId;
//   final int chatId;
//   final String senderId;
//   final String content;
//   final String messageType;
//   final DateTime createdAt;
//
//   List<MessageReadStatusModel> messageReadStatus = [];
//
//   MessageModel({
//     required this.messageId,
//     required this.chatId,
//     required this.senderId,
//     required this.content,
//     required this.messageType,
//     required this.createdAt,
//     this.messageReadStatus = const [],
//   });
//
//   factory MessageModel.fromJson(Map<String, dynamic> json) {
//     return MessageModel(
//       messageId: json['message_id'],
//       chatId: json['chat_id'],
//       senderId: json['sender_id'],
//       content: json['content'],
//       messageType: json['message_type'],
//       createdAt: DateTime.parse(json['created_at']),
//       messageReadStatus: (json['message_read_status'] as List).map((e) => MessageReadStatusModel.fromJson(e)).toList(),
//     );
//   }
// }

class MessageReadStatusModel {
  final int messageId;
  final String userId;
  final bool isRead;
  final DateTime createdAt;

  const MessageReadStatusModel({
    required this.messageId,
    required this.userId,
    required this.isRead,
    required this.createdAt,
  });

  factory MessageReadStatusModel.fromJson(Map<String, dynamic> json) {
    return MessageReadStatusModel(
      messageId: json['message_id'],
      userId: json['user_id'],
      isRead: json['is_read'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
