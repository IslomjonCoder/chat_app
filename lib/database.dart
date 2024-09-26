import 'package:drift/drift.dart';
import 'package:drift_sqlite_async/drift_sqlite_async.dart';
import 'package:powersync/powersync.dart' show PowerSyncDatabase;
import 'package:uuid/uuid.dart';

part 'database.g.dart';

const uuid = Uuid();

@DataClassName('Profile')
class Profiles extends Table {
  @override
  String get tableName => 'profile';

  TextColumn get id => text().clientDefault(() => uuid.v4())();

  TextColumn get username => text().withLength(min: 1, max: 50)();

  TextColumn get profilePicture => text().nullable()();

  DateTimeColumn get createdAt => dateTime().nullable().withDefault(currentDateAndTime)();

  DateTimeColumn get updatedAt => dateTime().nullable().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Chat')
class Chats extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())();

  TextColumn get chatName => text().nullable().withLength(min: 1, max: 100)();

  TextColumn get chatType => text().withLength(min: 1, max: 20)();

  DateTimeColumn get createdAt => dateTime().nullable().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'chats';

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Message')
class Messages extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())();

  TextColumn get chatId => text().references(Chats, #id)();

  TextColumn get senderId => text().references(Profiles, #id)();

  TextColumn get content => text()();

  TextColumn get messageType => text().withLength(min: 1, max: 20)();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'messages';

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

@DataClassName('ChatParticipant')
class ChatParticipants extends Table {
  TextColumn get chatId => text().references(Chats, #id)();

  TextColumn get userId => text().references(Profiles, #id)();

  DateTimeColumn get joinedAt => dateTime().nullable().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {chatId, userId};
}

@DataClassName('MessageReadStatus')
class MessageReadStatuses extends Table {
  TextColumn get id => text().clientDefault(() => uuid.v4())();

  TextColumn get messageId => text().references(Messages, #id)();

  TextColumn get userId => text().references(Profiles, #id)();

  BoolColumn get isRead => boolean().clientDefault(() => false)();

  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {id, userId, messageId};

  @override
  String get tableName => 'message_read_status';
}

@DataClassName('Attachment')
class Attachments extends Table {
  IntColumn get attachmentId => integer().nullable().autoIncrement()();

  TextColumn get messageId => text().references(Messages, #id)();

  TextColumn get filePath => text().withLength(min: 1, max: 255)();

  TextColumn get fileType => text().withLength(min: 1, max: 50)();

  DateTimeColumn get createdAt => dateTime().nullable().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'attachments';
}

@DataClassName('BlockedUser')
class BlockedUsers extends Table {
  @ReferenceName('blocker_id')
  TextColumn get blockerId => text().references(Profiles, #id)();

  @ReferenceName('blocked_id')
  TextColumn get blockedId => text().references(Profiles, #id)();

  DateTimeColumn get blockedAt => dateTime().nullable().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {blockerId, blockedId};

  @override
  String get tableName => 'blocked_users';
}

@DataClassName('Setting')
class Settings extends Table {
  IntColumn get settingId => integer().autoIncrement()();

  TextColumn get userId => text().references(Profiles, #id)();

  TextColumn get settingName => text().withLength(min: 1, max: 100)();

  TextColumn get settingValue => text().withLength(min: 1, max: 255)();

  DateTimeColumn get updatedAt => dateTime().nullable().withDefault(currentDateAndTime)();

  @override
  String get tableName => 'settings';
}

@DriftDatabase(
    tables: [Profiles, Chats, Messages, ChatParticipants, MessageReadStatuses, Attachments, BlockedUsers, Settings])
class AppDatabase extends _$AppDatabase {
  AppDatabase(PowerSyncDatabase db) : super(SqliteAsyncDriftConnection(db));

  @override
  int get schemaVersion => 1;

  // CRUD Operations for Profiles
  Future<List<Profile>> getAllProfiles() => select(profiles).get();

  Future<Profile> getProfileById(String userId) => (select(profiles)..where((p) => p.id.equals(userId))).getSingle();

  Future<void> insertProfile(Profile profile) => into(profiles).insert(profile);

  Future<bool> updateProfile(Profile profile) => update(profiles).replace(profile);

  Future<int> deleteProfile(String userId) => (delete(profiles)..where((p) => p.id.equals(userId))).go();

  // CRUD Operations for Chats
  Future<List<Chat>> getAllChats() => select(chats).get();

  Future<List<Chat>> getAllGroups() => (select(chats)..where((c) => c.chatType.equals('group'))).get();

  Future<Chat> getChatById(String chatId) => (select(chats)..where((c) => c.id.equals(chatId))).getSingle();

  Future<int> insertChat(Chat chat) => into(chats).insert(chat);

  Future<bool> updateChat(Chat chat) => update(chats).replace(chat);

  Future<int> deleteChat(String chatId) => (delete(chats)..where((c) => c.id.equals(chatId))).go();

  // CRUD Operations for Messages
  Future<List<Message>> getMessagesByChatId(String chatId) =>
      (select(messages)..where((m) => m.chatId.equals(chatId))).get();

  Stream<List<Message>> watchMessagesByChatId(String chatId) =>
      (select(messages)..where((m) => m.chatId.equals(chatId))).watch();

  Stream<List<MessageWithReadStatus>> getMessagesWithReadStatusByChatId(String chatId) {
    // Alias the profiles table to avoid conflict when joining twice
    final senderProfileAlias = alias(profiles, 'sender_profile');
    final readerProfileAlias = alias(profiles, 'reader_profile');

    // Create the query for joining messages, read statuses, and profiles
    final query = select(messages).join([
      leftOuterJoin(messageReadStatuses, messageReadStatuses.messageId.equalsExp(messages.id)),
      leftOuterJoin(readerProfileAlias, readerProfileAlias.id.equalsExp(messageReadStatuses.userId)),
      leftOuterJoin(senderProfileAlias, senderProfileAlias.id.equalsExp(messages.senderId)), // Join again to get the sender's profile
    ])
      ..orderBy([OrderingTerm(expression: messages.createdAt)]);

    // Convert the query to a stream
    return query.watch().map((rows) {
      final Map<String, MessageWithReadStatus> messageMap = {};

      // Process each row and populate the messageMap
      for (final row in rows) {
        final message = row.readTable(messages);
        final readerProfile = row.readTableOrNull(readerProfileAlias);
        final senderProfile = row.readTableOrNull(senderProfileAlias);

        // Check if the message is already in the map
        if (messageMap.containsKey(message.id)) {
          // If the reader profile is not null, add it to the profiles list
          if (readerProfile != null) {
            messageMap[message.id]?.profiles.add(readerProfile);
          }
        } else {
          // If the message is not in the map, add it with the current reader and sender profiles
          messageMap[message.id] = MessageWithReadStatus(
            message: message,
            profiles: readerProfile != null ? [readerProfile] : [],
            senderProfile: senderProfile, // Assign the sender's profile
          );
        }
      }

      // Return the list of messages with read statuses
      return messageMap.values.toList();
    });
  }


  Future<int> insertMessage(Insertable<Message> message) => into(messages).insert(message);

  Future<int> deleteMessage(String messageId) => (delete(messages)..where((m) => m.id.equals(messageId))).go();

  // Additional methods for handling more complex operations
  Future<void> markMessageAsRead(String messageId, String userId) async {
    final status = await (select(messageReadStatuses)..where((s) => s.id.equals(messageId) & s.userId.equals(userId)))
        .getSingleOrNull();
    if (status != null) {
      await (update(messageReadStatuses)..where((s) => s.id.equals(messageId) & s.userId.equals(userId)))
          .write(const MessageReadStatusesCompanion(isRead: Value(true)));
    } else {
      await into(messageReadStatuses).insert(MessageReadStatusesCompanion.insert(
        messageId: messageId,
        userId: userId,
        isRead: Value(true),
      ));
    }
  }

  Future<void> addParticipantToChat(String id, String userId) async {
    await into(chatParticipants).insert(ChatParticipant(
      chatId: id,
      userId: userId,
      joinedAt: DateTime.now(),
    ));
  }

  Future<List<ChatParticipant>> getParticipantsByChatId(String chatId) =>
      (select(chatParticipants)..where((cp) => cp.chatId.equals(chatId))).get();

  // CRUD Operations for Attachments
  Future<List<Attachment>> getAttachmentsByMessageId(String messageId) =>
      (select(attachments)..where((a) => a.messageId.equals(messageId))).get();

  Future<int> insertAttachment(Attachment attachment) => into(attachments).insert(attachment);

  Future<int> deleteAttachment(int attachmentId) =>
      (delete(attachments)..where((a) => a.attachmentId.equals(attachmentId))).go();

  // Future<int> countUnreadMessages(String chatId, String userId) async {
  //   final chatMessageCount = await (select(messages)..where((m) => m.chatId.equals(chatId))).getCount();
  //
  //   count of chat messages subtracted by count of read messages
    // final response = await (select(messages)..where((m) => m.chatId.equals(chatId))).map((m) => m.id).get();
    // final count = await (select(messageReadStatuses)
    //   ..where((s) => s.userId.equals(userId) & s.isRead.equals(false) & s.messageId.isIn((response)))).get();
    // return count.length;
  //
  //
  // }
}

class MessageWithReadStatus {
  final Message message;
  final List<Profile> profiles;

  final Profile? senderProfile; // New field for the message sender's profile

  MessageWithReadStatus({
    required this.message,
    required this.profiles,
    this.senderProfile, // Optional parameter for sender's profile
  });
}
