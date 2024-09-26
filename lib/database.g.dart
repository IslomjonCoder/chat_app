// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _profilePictureMeta =
      const VerificationMeta('profilePicture');
  @override
  late final GeneratedColumn<String> profilePicture = GeneratedColumn<String>(
      'profile_picture', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, profilePicture, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'profile';
  @override
  VerificationContext validateIntegrity(Insertable<Profile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('profile_picture')) {
      context.handle(
          _profilePictureMeta,
          profilePicture.isAcceptableOrUnknown(
              data['profile_picture']!, _profilePictureMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Profile(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      profilePicture: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_picture']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(attachedDatabase, alias);
  }
}

class Profile extends DataClass implements Insertable<Profile> {
  final String id;
  final String username;
  final String? profilePicture;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  const Profile(
      {required this.id,
      required this.username,
      this.profilePicture,
      this.createdAt,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['username'] = Variable<String>(username);
    if (!nullToAbsent || profilePicture != null) {
      map['profile_picture'] = Variable<String>(profilePicture);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: Value(id),
      username: Value(username),
      profilePicture: profilePicture == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePicture),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      profilePicture: serializer.fromJson<String?>(json['profilePicture']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'profilePicture': serializer.toJson<String?>(profilePicture),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Profile copyWith(
          {String? id,
          String? username,
          Value<String?> profilePicture = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      Profile(
        id: id ?? this.id,
        username: username ?? this.username,
        profilePicture:
            profilePicture.present ? profilePicture.value : this.profilePicture,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, username, profilePicture, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.username == this.username &&
          other.profilePicture == this.profilePicture &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<String> id;
  final Value<String> username;
  final Value<String?> profilePicture;
  final Value<DateTime?> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> rowid;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.profilePicture = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    this.profilePicture = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : username = Value(username);
  static Insertable<Profile> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? profilePicture,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (profilePicture != null) 'profile_picture': profilePicture,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProfilesCompanion copyWith(
      {Value<String>? id,
      Value<String>? username,
      Value<String?>? profilePicture,
      Value<DateTime?>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int>? rowid}) {
    return ProfilesCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      profilePicture: profilePicture ?? this.profilePicture,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (profilePicture.present) {
      map['profile_picture'] = Variable<String>(profilePicture.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('profilePicture: $profilePicture, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChatsTable extends Chats with TableInfo<$ChatsTable, Chat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _chatNameMeta =
      const VerificationMeta('chatName');
  @override
  late final GeneratedColumn<String> chatName = GeneratedColumn<String>(
      'chat_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _chatTypeMeta =
      const VerificationMeta('chatType');
  @override
  late final GeneratedColumn<String> chatType = GeneratedColumn<String>(
      'chat_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, chatName, chatType, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chats';
  @override
  VerificationContext validateIntegrity(Insertable<Chat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chat_name')) {
      context.handle(_chatNameMeta,
          chatName.isAcceptableOrUnknown(data['chat_name']!, _chatNameMeta));
    }
    if (data.containsKey('chat_type')) {
      context.handle(_chatTypeMeta,
          chatType.isAcceptableOrUnknown(data['chat_type']!, _chatTypeMeta));
    } else if (isInserting) {
      context.missing(_chatTypeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      chatName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chat_name']),
      chatType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chat_type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $ChatsTable createAlias(String alias) {
    return $ChatsTable(attachedDatabase, alias);
  }
}

class Chat extends DataClass implements Insertable<Chat> {
  final String id;
  final String? chatName;
  final String chatType;
  final DateTime? createdAt;
  const Chat(
      {required this.id,
      this.chatName,
      required this.chatType,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || chatName != null) {
      map['chat_name'] = Variable<String>(chatName);
    }
    map['chat_type'] = Variable<String>(chatType);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  ChatsCompanion toCompanion(bool nullToAbsent) {
    return ChatsCompanion(
      id: Value(id),
      chatName: chatName == null && nullToAbsent
          ? const Value.absent()
          : Value(chatName),
      chatType: Value(chatType),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Chat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chat(
      id: serializer.fromJson<String>(json['id']),
      chatName: serializer.fromJson<String?>(json['chatName']),
      chatType: serializer.fromJson<String>(json['chatType']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'chatName': serializer.toJson<String?>(chatName),
      'chatType': serializer.toJson<String>(chatType),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  Chat copyWith(
          {String? id,
          Value<String?> chatName = const Value.absent(),
          String? chatType,
          Value<DateTime?> createdAt = const Value.absent()}) =>
      Chat(
        id: id ?? this.id,
        chatName: chatName.present ? chatName.value : this.chatName,
        chatType: chatType ?? this.chatType,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Chat(')
          ..write('id: $id, ')
          ..write('chatName: $chatName, ')
          ..write('chatType: $chatType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chatName, chatType, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chat &&
          other.id == this.id &&
          other.chatName == this.chatName &&
          other.chatType == this.chatType &&
          other.createdAt == this.createdAt);
}

class ChatsCompanion extends UpdateCompanion<Chat> {
  final Value<String> id;
  final Value<String?> chatName;
  final Value<String> chatType;
  final Value<DateTime?> createdAt;
  final Value<int> rowid;
  const ChatsCompanion({
    this.id = const Value.absent(),
    this.chatName = const Value.absent(),
    this.chatType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChatsCompanion.insert({
    this.id = const Value.absent(),
    this.chatName = const Value.absent(),
    required String chatType,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : chatType = Value(chatType);
  static Insertable<Chat> custom({
    Expression<String>? id,
    Expression<String>? chatName,
    Expression<String>? chatType,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatName != null) 'chat_name': chatName,
      if (chatType != null) 'chat_type': chatType,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChatsCompanion copyWith(
      {Value<String>? id,
      Value<String?>? chatName,
      Value<String>? chatType,
      Value<DateTime?>? createdAt,
      Value<int>? rowid}) {
    return ChatsCompanion(
      id: id ?? this.id,
      chatName: chatName ?? this.chatName,
      chatType: chatType ?? this.chatType,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (chatName.present) {
      map['chat_name'] = Variable<String>(chatName.value);
    }
    if (chatType.present) {
      map['chat_type'] = Variable<String>(chatType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatsCompanion(')
          ..write('id: $id, ')
          ..write('chatName: $chatName, ')
          ..write('chatType: $chatType, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  @override
  late final GeneratedColumn<String> chatId = GeneratedColumn<String>(
      'chat_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES chats (id)'));
  static const VerificationMeta _senderIdMeta =
      const VerificationMeta('senderId');
  @override
  late final GeneratedColumn<String> senderId = GeneratedColumn<String>(
      'sender_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES profile (id)'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _messageTypeMeta =
      const VerificationMeta('messageType');
  @override
  late final GeneratedColumn<String> messageType = GeneratedColumn<String>(
      'message_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, chatId, senderId, content, messageType, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages';
  @override
  VerificationContext validateIntegrity(Insertable<Message> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chat_id')) {
      context.handle(_chatIdMeta,
          chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta));
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('sender_id')) {
      context.handle(_senderIdMeta,
          senderId.isAcceptableOrUnknown(data['sender_id']!, _senderIdMeta));
    } else if (isInserting) {
      context.missing(_senderIdMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('message_type')) {
      context.handle(
          _messageTypeMeta,
          messageType.isAcceptableOrUnknown(
              data['message_type']!, _messageTypeMeta));
    } else if (isInserting) {
      context.missing(_messageTypeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Message(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      chatId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chat_id'])!,
      senderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sender_id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      messageType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message_type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class Message extends DataClass implements Insertable<Message> {
  final String id;
  final String chatId;
  final String senderId;
  final String content;
  final String messageType;
  final DateTime createdAt;
  const Message(
      {required this.id,
      required this.chatId,
      required this.senderId,
      required this.content,
      required this.messageType,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['chat_id'] = Variable<String>(chatId);
    map['sender_id'] = Variable<String>(senderId);
    map['content'] = Variable<String>(content);
    map['message_type'] = Variable<String>(messageType);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      chatId: Value(chatId),
      senderId: Value(senderId),
      content: Value(content),
      messageType: Value(messageType),
      createdAt: Value(createdAt),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<String>(json['id']),
      chatId: serializer.fromJson<String>(json['chatId']),
      senderId: serializer.fromJson<String>(json['senderId']),
      content: serializer.fromJson<String>(json['content']),
      messageType: serializer.fromJson<String>(json['messageType']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'chatId': serializer.toJson<String>(chatId),
      'senderId': serializer.toJson<String>(senderId),
      'content': serializer.toJson<String>(content),
      'messageType': serializer.toJson<String>(messageType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Message copyWith(
          {String? id,
          String? chatId,
          String? senderId,
          String? content,
          String? messageType,
          DateTime? createdAt}) =>
      Message(
        id: id ?? this.id,
        chatId: chatId ?? this.chatId,
        senderId: senderId ?? this.senderId,
        content: content ?? this.content,
        messageType: messageType ?? this.messageType,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('senderId: $senderId, ')
          ..write('content: $content, ')
          ..write('messageType: $messageType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, chatId, senderId, content, messageType, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          other.id == this.id &&
          other.chatId == this.chatId &&
          other.senderId == this.senderId &&
          other.content == this.content &&
          other.messageType == this.messageType &&
          other.createdAt == this.createdAt);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<String> id;
  final Value<String> chatId;
  final Value<String> senderId;
  final Value<String> content;
  final Value<String> messageType;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.chatId = const Value.absent(),
    this.senderId = const Value.absent(),
    this.content = const Value.absent(),
    this.messageType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MessagesCompanion.insert({
    this.id = const Value.absent(),
    required String chatId,
    required String senderId,
    required String content,
    required String messageType,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : chatId = Value(chatId),
        senderId = Value(senderId),
        content = Value(content),
        messageType = Value(messageType);
  static Insertable<Message> custom({
    Expression<String>? id,
    Expression<String>? chatId,
    Expression<String>? senderId,
    Expression<String>? content,
    Expression<String>? messageType,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chatId != null) 'chat_id': chatId,
      if (senderId != null) 'sender_id': senderId,
      if (content != null) 'content': content,
      if (messageType != null) 'message_type': messageType,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MessagesCompanion copyWith(
      {Value<String>? id,
      Value<String>? chatId,
      Value<String>? senderId,
      Value<String>? content,
      Value<String>? messageType,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return MessagesCompanion(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      senderId: senderId ?? this.senderId,
      content: content ?? this.content,
      messageType: messageType ?? this.messageType,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (chatId.present) {
      map['chat_id'] = Variable<String>(chatId.value);
    }
    if (senderId.present) {
      map['sender_id'] = Variable<String>(senderId.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (messageType.present) {
      map['message_type'] = Variable<String>(messageType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('chatId: $chatId, ')
          ..write('senderId: $senderId, ')
          ..write('content: $content, ')
          ..write('messageType: $messageType, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChatParticipantsTable extends ChatParticipants
    with TableInfo<$ChatParticipantsTable, ChatParticipant> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatParticipantsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _chatIdMeta = const VerificationMeta('chatId');
  @override
  late final GeneratedColumn<String> chatId = GeneratedColumn<String>(
      'chat_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES chats (id)'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES profile (id)'));
  static const VerificationMeta _joinedAtMeta =
      const VerificationMeta('joinedAt');
  @override
  late final GeneratedColumn<DateTime> joinedAt = GeneratedColumn<DateTime>(
      'joined_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [chatId, userId, joinedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_participants';
  @override
  VerificationContext validateIntegrity(Insertable<ChatParticipant> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('chat_id')) {
      context.handle(_chatIdMeta,
          chatId.isAcceptableOrUnknown(data['chat_id']!, _chatIdMeta));
    } else if (isInserting) {
      context.missing(_chatIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('joined_at')) {
      context.handle(_joinedAtMeta,
          joinedAt.isAcceptableOrUnknown(data['joined_at']!, _joinedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {chatId, userId};
  @override
  ChatParticipant map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatParticipant(
      chatId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chat_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      joinedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}joined_at']),
    );
  }

  @override
  $ChatParticipantsTable createAlias(String alias) {
    return $ChatParticipantsTable(attachedDatabase, alias);
  }
}

class ChatParticipant extends DataClass implements Insertable<ChatParticipant> {
  final String chatId;
  final String userId;
  final DateTime? joinedAt;
  const ChatParticipant(
      {required this.chatId, required this.userId, this.joinedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['chat_id'] = Variable<String>(chatId);
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || joinedAt != null) {
      map['joined_at'] = Variable<DateTime>(joinedAt);
    }
    return map;
  }

  ChatParticipantsCompanion toCompanion(bool nullToAbsent) {
    return ChatParticipantsCompanion(
      chatId: Value(chatId),
      userId: Value(userId),
      joinedAt: joinedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(joinedAt),
    );
  }

  factory ChatParticipant.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatParticipant(
      chatId: serializer.fromJson<String>(json['chatId']),
      userId: serializer.fromJson<String>(json['userId']),
      joinedAt: serializer.fromJson<DateTime?>(json['joinedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'chatId': serializer.toJson<String>(chatId),
      'userId': serializer.toJson<String>(userId),
      'joinedAt': serializer.toJson<DateTime?>(joinedAt),
    };
  }

  ChatParticipant copyWith(
          {String? chatId,
          String? userId,
          Value<DateTime?> joinedAt = const Value.absent()}) =>
      ChatParticipant(
        chatId: chatId ?? this.chatId,
        userId: userId ?? this.userId,
        joinedAt: joinedAt.present ? joinedAt.value : this.joinedAt,
      );
  @override
  String toString() {
    return (StringBuffer('ChatParticipant(')
          ..write('chatId: $chatId, ')
          ..write('userId: $userId, ')
          ..write('joinedAt: $joinedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(chatId, userId, joinedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatParticipant &&
          other.chatId == this.chatId &&
          other.userId == this.userId &&
          other.joinedAt == this.joinedAt);
}

class ChatParticipantsCompanion extends UpdateCompanion<ChatParticipant> {
  final Value<String> chatId;
  final Value<String> userId;
  final Value<DateTime?> joinedAt;
  final Value<int> rowid;
  const ChatParticipantsCompanion({
    this.chatId = const Value.absent(),
    this.userId = const Value.absent(),
    this.joinedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChatParticipantsCompanion.insert({
    required String chatId,
    required String userId,
    this.joinedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : chatId = Value(chatId),
        userId = Value(userId);
  static Insertable<ChatParticipant> custom({
    Expression<String>? chatId,
    Expression<String>? userId,
    Expression<DateTime>? joinedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (chatId != null) 'chat_id': chatId,
      if (userId != null) 'user_id': userId,
      if (joinedAt != null) 'joined_at': joinedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChatParticipantsCompanion copyWith(
      {Value<String>? chatId,
      Value<String>? userId,
      Value<DateTime?>? joinedAt,
      Value<int>? rowid}) {
    return ChatParticipantsCompanion(
      chatId: chatId ?? this.chatId,
      userId: userId ?? this.userId,
      joinedAt: joinedAt ?? this.joinedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (chatId.present) {
      map['chat_id'] = Variable<String>(chatId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (joinedAt.present) {
      map['joined_at'] = Variable<DateTime>(joinedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatParticipantsCompanion(')
          ..write('chatId: $chatId, ')
          ..write('userId: $userId, ')
          ..write('joinedAt: $joinedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MessageReadStatusesTable extends MessageReadStatuses
    with TableInfo<$MessageReadStatusesTable, MessageReadStatus> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessageReadStatusesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  static const VerificationMeta _messageIdMeta =
      const VerificationMeta('messageId');
  @override
  late final GeneratedColumn<String> messageId = GeneratedColumn<String>(
      'message_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES messages (id)'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES profile (id)'));
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
      'is_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'),
      clientDefault: () => false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  @override
  List<GeneratedColumn> get $columns =>
      [id, messageId, userId, isRead, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'message_read_status';
  @override
  VerificationContext validateIntegrity(Insertable<MessageReadStatus> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message_id')) {
      context.handle(_messageIdMeta,
          messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta));
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, userId, messageId};
  @override
  MessageReadStatus map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessageReadStatus(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      messageId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $MessageReadStatusesTable createAlias(String alias) {
    return $MessageReadStatusesTable(attachedDatabase, alias);
  }
}

class MessageReadStatus extends DataClass
    implements Insertable<MessageReadStatus> {
  final String id;
  final String messageId;
  final String userId;
  final bool isRead;
  final DateTime createdAt;
  const MessageReadStatus(
      {required this.id,
      required this.messageId,
      required this.userId,
      required this.isRead,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['message_id'] = Variable<String>(messageId);
    map['user_id'] = Variable<String>(userId);
    map['is_read'] = Variable<bool>(isRead);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MessageReadStatusesCompanion toCompanion(bool nullToAbsent) {
    return MessageReadStatusesCompanion(
      id: Value(id),
      messageId: Value(messageId),
      userId: Value(userId),
      isRead: Value(isRead),
      createdAt: Value(createdAt),
    );
  }

  factory MessageReadStatus.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessageReadStatus(
      id: serializer.fromJson<String>(json['id']),
      messageId: serializer.fromJson<String>(json['messageId']),
      userId: serializer.fromJson<String>(json['userId']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'messageId': serializer.toJson<String>(messageId),
      'userId': serializer.toJson<String>(userId),
      'isRead': serializer.toJson<bool>(isRead),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MessageReadStatus copyWith(
          {String? id,
          String? messageId,
          String? userId,
          bool? isRead,
          DateTime? createdAt}) =>
      MessageReadStatus(
        id: id ?? this.id,
        messageId: messageId ?? this.messageId,
        userId: userId ?? this.userId,
        isRead: isRead ?? this.isRead,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('MessageReadStatus(')
          ..write('id: $id, ')
          ..write('messageId: $messageId, ')
          ..write('userId: $userId, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, messageId, userId, isRead, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageReadStatus &&
          other.id == this.id &&
          other.messageId == this.messageId &&
          other.userId == this.userId &&
          other.isRead == this.isRead &&
          other.createdAt == this.createdAt);
}

class MessageReadStatusesCompanion extends UpdateCompanion<MessageReadStatus> {
  final Value<String> id;
  final Value<String> messageId;
  final Value<String> userId;
  final Value<bool> isRead;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MessageReadStatusesCompanion({
    this.id = const Value.absent(),
    this.messageId = const Value.absent(),
    this.userId = const Value.absent(),
    this.isRead = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MessageReadStatusesCompanion.insert({
    this.id = const Value.absent(),
    required String messageId,
    required String userId,
    this.isRead = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : messageId = Value(messageId),
        userId = Value(userId);
  static Insertable<MessageReadStatus> custom({
    Expression<String>? id,
    Expression<String>? messageId,
    Expression<String>? userId,
    Expression<bool>? isRead,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (messageId != null) 'message_id': messageId,
      if (userId != null) 'user_id': userId,
      if (isRead != null) 'is_read': isRead,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MessageReadStatusesCompanion copyWith(
      {Value<String>? id,
      Value<String>? messageId,
      Value<String>? userId,
      Value<bool>? isRead,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return MessageReadStatusesCompanion(
      id: id ?? this.id,
      messageId: messageId ?? this.messageId,
      userId: userId ?? this.userId,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (messageId.present) {
      map['message_id'] = Variable<String>(messageId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageReadStatusesCompanion(')
          ..write('id: $id, ')
          ..write('messageId: $messageId, ')
          ..write('userId: $userId, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, Attachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _attachmentIdMeta =
      const VerificationMeta('attachmentId');
  @override
  late final GeneratedColumn<int> attachmentId = GeneratedColumn<int>(
      'attachment_id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _messageIdMeta =
      const VerificationMeta('messageId');
  @override
  late final GeneratedColumn<String> messageId = GeneratedColumn<String>(
      'message_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES messages (id)'));
  static const VerificationMeta _filePathMeta =
      const VerificationMeta('filePath');
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
      'file_path', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fileTypeMeta =
      const VerificationMeta('fileType');
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
      'file_type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [attachmentId, messageId, filePath, fileType, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(Insertable<Attachment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('attachment_id')) {
      context.handle(
          _attachmentIdMeta,
          attachmentId.isAcceptableOrUnknown(
              data['attachment_id']!, _attachmentIdMeta));
    }
    if (data.containsKey('message_id')) {
      context.handle(_messageIdMeta,
          messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta));
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(_filePathMeta,
          filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta));
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(_fileTypeMeta,
          fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta));
    } else if (isInserting) {
      context.missing(_fileTypeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {attachmentId};
  @override
  Attachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Attachment(
      attachmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attachment_id']),
      messageId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message_id'])!,
      filePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_path'])!,
      fileType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final int? attachmentId;
  final String messageId;
  final String filePath;
  final String fileType;
  final DateTime? createdAt;
  const Attachment(
      {this.attachmentId,
      required this.messageId,
      required this.filePath,
      required this.fileType,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || attachmentId != null) {
      map['attachment_id'] = Variable<int>(attachmentId);
    }
    map['message_id'] = Variable<String>(messageId);
    map['file_path'] = Variable<String>(filePath);
    map['file_type'] = Variable<String>(fileType);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  AttachmentsCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      attachmentId: attachmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentId),
      messageId: Value(messageId),
      filePath: Value(filePath),
      fileType: Value(fileType),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory Attachment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Attachment(
      attachmentId: serializer.fromJson<int?>(json['attachmentId']),
      messageId: serializer.fromJson<String>(json['messageId']),
      filePath: serializer.fromJson<String>(json['filePath']),
      fileType: serializer.fromJson<String>(json['fileType']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'attachmentId': serializer.toJson<int?>(attachmentId),
      'messageId': serializer.toJson<String>(messageId),
      'filePath': serializer.toJson<String>(filePath),
      'fileType': serializer.toJson<String>(fileType),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  Attachment copyWith(
          {Value<int?> attachmentId = const Value.absent(),
          String? messageId,
          String? filePath,
          String? fileType,
          Value<DateTime?> createdAt = const Value.absent()}) =>
      Attachment(
        attachmentId:
            attachmentId.present ? attachmentId.value : this.attachmentId,
        messageId: messageId ?? this.messageId,
        filePath: filePath ?? this.filePath,
        fileType: fileType ?? this.fileType,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Attachment(')
          ..write('attachmentId: $attachmentId, ')
          ..write('messageId: $messageId, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(attachmentId, messageId, filePath, fileType, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attachment &&
          other.attachmentId == this.attachmentId &&
          other.messageId == this.messageId &&
          other.filePath == this.filePath &&
          other.fileType == this.fileType &&
          other.createdAt == this.createdAt);
}

class AttachmentsCompanion extends UpdateCompanion<Attachment> {
  final Value<int?> attachmentId;
  final Value<String> messageId;
  final Value<String> filePath;
  final Value<String> fileType;
  final Value<DateTime?> createdAt;
  const AttachmentsCompanion({
    this.attachmentId = const Value.absent(),
    this.messageId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileType = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    this.attachmentId = const Value.absent(),
    required String messageId,
    required String filePath,
    required String fileType,
    this.createdAt = const Value.absent(),
  })  : messageId = Value(messageId),
        filePath = Value(filePath),
        fileType = Value(fileType);
  static Insertable<Attachment> custom({
    Expression<int>? attachmentId,
    Expression<String>? messageId,
    Expression<String>? filePath,
    Expression<String>? fileType,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (attachmentId != null) 'attachment_id': attachmentId,
      if (messageId != null) 'message_id': messageId,
      if (filePath != null) 'file_path': filePath,
      if (fileType != null) 'file_type': fileType,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AttachmentsCompanion copyWith(
      {Value<int?>? attachmentId,
      Value<String>? messageId,
      Value<String>? filePath,
      Value<String>? fileType,
      Value<DateTime?>? createdAt}) {
    return AttachmentsCompanion(
      attachmentId: attachmentId ?? this.attachmentId,
      messageId: messageId ?? this.messageId,
      filePath: filePath ?? this.filePath,
      fileType: fileType ?? this.fileType,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (attachmentId.present) {
      map['attachment_id'] = Variable<int>(attachmentId.value);
    }
    if (messageId.present) {
      map['message_id'] = Variable<String>(messageId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsCompanion(')
          ..write('attachmentId: $attachmentId, ')
          ..write('messageId: $messageId, ')
          ..write('filePath: $filePath, ')
          ..write('fileType: $fileType, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $BlockedUsersTable extends BlockedUsers
    with TableInfo<$BlockedUsersTable, BlockedUser> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BlockedUsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _blockerIdMeta =
      const VerificationMeta('blockerId');
  @override
  late final GeneratedColumn<String> blockerId = GeneratedColumn<String>(
      'blocker_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES profile (id)'));
  static const VerificationMeta _blockedIdMeta =
      const VerificationMeta('blockedId');
  @override
  late final GeneratedColumn<String> blockedId = GeneratedColumn<String>(
      'blocked_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES profile (id)'));
  static const VerificationMeta _blockedAtMeta =
      const VerificationMeta('blockedAt');
  @override
  late final GeneratedColumn<DateTime> blockedAt = GeneratedColumn<DateTime>(
      'blocked_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [blockerId, blockedId, blockedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blocked_users';
  @override
  VerificationContext validateIntegrity(Insertable<BlockedUser> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('blocker_id')) {
      context.handle(_blockerIdMeta,
          blockerId.isAcceptableOrUnknown(data['blocker_id']!, _blockerIdMeta));
    } else if (isInserting) {
      context.missing(_blockerIdMeta);
    }
    if (data.containsKey('blocked_id')) {
      context.handle(_blockedIdMeta,
          blockedId.isAcceptableOrUnknown(data['blocked_id']!, _blockedIdMeta));
    } else if (isInserting) {
      context.missing(_blockedIdMeta);
    }
    if (data.containsKey('blocked_at')) {
      context.handle(_blockedAtMeta,
          blockedAt.isAcceptableOrUnknown(data['blocked_at']!, _blockedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {blockerId, blockedId};
  @override
  BlockedUser map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BlockedUser(
      blockerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blocker_id'])!,
      blockedId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blocked_id'])!,
      blockedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}blocked_at']),
    );
  }

  @override
  $BlockedUsersTable createAlias(String alias) {
    return $BlockedUsersTable(attachedDatabase, alias);
  }
}

class BlockedUser extends DataClass implements Insertable<BlockedUser> {
  final String blockerId;
  final String blockedId;
  final DateTime? blockedAt;
  const BlockedUser(
      {required this.blockerId, required this.blockedId, this.blockedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['blocker_id'] = Variable<String>(blockerId);
    map['blocked_id'] = Variable<String>(blockedId);
    if (!nullToAbsent || blockedAt != null) {
      map['blocked_at'] = Variable<DateTime>(blockedAt);
    }
    return map;
  }

  BlockedUsersCompanion toCompanion(bool nullToAbsent) {
    return BlockedUsersCompanion(
      blockerId: Value(blockerId),
      blockedId: Value(blockedId),
      blockedAt: blockedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(blockedAt),
    );
  }

  factory BlockedUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BlockedUser(
      blockerId: serializer.fromJson<String>(json['blockerId']),
      blockedId: serializer.fromJson<String>(json['blockedId']),
      blockedAt: serializer.fromJson<DateTime?>(json['blockedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'blockerId': serializer.toJson<String>(blockerId),
      'blockedId': serializer.toJson<String>(blockedId),
      'blockedAt': serializer.toJson<DateTime?>(blockedAt),
    };
  }

  BlockedUser copyWith(
          {String? blockerId,
          String? blockedId,
          Value<DateTime?> blockedAt = const Value.absent()}) =>
      BlockedUser(
        blockerId: blockerId ?? this.blockerId,
        blockedId: blockedId ?? this.blockedId,
        blockedAt: blockedAt.present ? blockedAt.value : this.blockedAt,
      );
  @override
  String toString() {
    return (StringBuffer('BlockedUser(')
          ..write('blockerId: $blockerId, ')
          ..write('blockedId: $blockedId, ')
          ..write('blockedAt: $blockedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(blockerId, blockedId, blockedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BlockedUser &&
          other.blockerId == this.blockerId &&
          other.blockedId == this.blockedId &&
          other.blockedAt == this.blockedAt);
}

class BlockedUsersCompanion extends UpdateCompanion<BlockedUser> {
  final Value<String> blockerId;
  final Value<String> blockedId;
  final Value<DateTime?> blockedAt;
  final Value<int> rowid;
  const BlockedUsersCompanion({
    this.blockerId = const Value.absent(),
    this.blockedId = const Value.absent(),
    this.blockedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BlockedUsersCompanion.insert({
    required String blockerId,
    required String blockedId,
    this.blockedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : blockerId = Value(blockerId),
        blockedId = Value(blockedId);
  static Insertable<BlockedUser> custom({
    Expression<String>? blockerId,
    Expression<String>? blockedId,
    Expression<DateTime>? blockedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (blockerId != null) 'blocker_id': blockerId,
      if (blockedId != null) 'blocked_id': blockedId,
      if (blockedAt != null) 'blocked_at': blockedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BlockedUsersCompanion copyWith(
      {Value<String>? blockerId,
      Value<String>? blockedId,
      Value<DateTime?>? blockedAt,
      Value<int>? rowid}) {
    return BlockedUsersCompanion(
      blockerId: blockerId ?? this.blockerId,
      blockedId: blockedId ?? this.blockedId,
      blockedAt: blockedAt ?? this.blockedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (blockerId.present) {
      map['blocker_id'] = Variable<String>(blockerId.value);
    }
    if (blockedId.present) {
      map['blocked_id'] = Variable<String>(blockedId.value);
    }
    if (blockedAt.present) {
      map['blocked_at'] = Variable<DateTime>(blockedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlockedUsersCompanion(')
          ..write('blockerId: $blockerId, ')
          ..write('blockedId: $blockedId, ')
          ..write('blockedAt: $blockedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _settingIdMeta =
      const VerificationMeta('settingId');
  @override
  late final GeneratedColumn<int> settingId = GeneratedColumn<int>(
      'setting_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES profile (id)'));
  static const VerificationMeta _settingNameMeta =
      const VerificationMeta('settingName');
  @override
  late final GeneratedColumn<String> settingName = GeneratedColumn<String>(
      'setting_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _settingValueMeta =
      const VerificationMeta('settingValue');
  @override
  late final GeneratedColumn<String> settingValue = GeneratedColumn<String>(
      'setting_value', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [settingId, userId, settingName, settingValue, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('setting_id')) {
      context.handle(_settingIdMeta,
          settingId.isAcceptableOrUnknown(data['setting_id']!, _settingIdMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('setting_name')) {
      context.handle(
          _settingNameMeta,
          settingName.isAcceptableOrUnknown(
              data['setting_name']!, _settingNameMeta));
    } else if (isInserting) {
      context.missing(_settingNameMeta);
    }
    if (data.containsKey('setting_value')) {
      context.handle(
          _settingValueMeta,
          settingValue.isAcceptableOrUnknown(
              data['setting_value']!, _settingValueMeta));
    } else if (isInserting) {
      context.missing(_settingValueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {settingId};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      settingId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}setting_id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      settingName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}setting_name'])!,
      settingValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}setting_value'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int settingId;
  final String userId;
  final String settingName;
  final String settingValue;
  final DateTime? updatedAt;
  const Setting(
      {required this.settingId,
      required this.userId,
      required this.settingName,
      required this.settingValue,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['setting_id'] = Variable<int>(settingId);
    map['user_id'] = Variable<String>(userId);
    map['setting_name'] = Variable<String>(settingName);
    map['setting_value'] = Variable<String>(settingValue);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      settingId: Value(settingId),
      userId: Value(userId),
      settingName: Value(settingName),
      settingValue: Value(settingValue),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      settingId: serializer.fromJson<int>(json['settingId']),
      userId: serializer.fromJson<String>(json['userId']),
      settingName: serializer.fromJson<String>(json['settingName']),
      settingValue: serializer.fromJson<String>(json['settingValue']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'settingId': serializer.toJson<int>(settingId),
      'userId': serializer.toJson<String>(userId),
      'settingName': serializer.toJson<String>(settingName),
      'settingValue': serializer.toJson<String>(settingValue),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Setting copyWith(
          {int? settingId,
          String? userId,
          String? settingName,
          String? settingValue,
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      Setting(
        settingId: settingId ?? this.settingId,
        userId: userId ?? this.userId,
        settingName: settingName ?? this.settingName,
        settingValue: settingValue ?? this.settingValue,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('settingId: $settingId, ')
          ..write('userId: $userId, ')
          ..write('settingName: $settingName, ')
          ..write('settingValue: $settingValue, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(settingId, userId, settingName, settingValue, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.settingId == this.settingId &&
          other.userId == this.userId &&
          other.settingName == this.settingName &&
          other.settingValue == this.settingValue &&
          other.updatedAt == this.updatedAt);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> settingId;
  final Value<String> userId;
  final Value<String> settingName;
  final Value<String> settingValue;
  final Value<DateTime?> updatedAt;
  const SettingsCompanion({
    this.settingId = const Value.absent(),
    this.userId = const Value.absent(),
    this.settingName = const Value.absent(),
    this.settingValue = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.settingId = const Value.absent(),
    required String userId,
    required String settingName,
    required String settingValue,
    this.updatedAt = const Value.absent(),
  })  : userId = Value(userId),
        settingName = Value(settingName),
        settingValue = Value(settingValue);
  static Insertable<Setting> custom({
    Expression<int>? settingId,
    Expression<String>? userId,
    Expression<String>? settingName,
    Expression<String>? settingValue,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (settingId != null) 'setting_id': settingId,
      if (userId != null) 'user_id': userId,
      if (settingName != null) 'setting_name': settingName,
      if (settingValue != null) 'setting_value': settingValue,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SettingsCompanion copyWith(
      {Value<int>? settingId,
      Value<String>? userId,
      Value<String>? settingName,
      Value<String>? settingValue,
      Value<DateTime?>? updatedAt}) {
    return SettingsCompanion(
      settingId: settingId ?? this.settingId,
      userId: userId ?? this.userId,
      settingName: settingName ?? this.settingName,
      settingValue: settingValue ?? this.settingValue,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (settingId.present) {
      map['setting_id'] = Variable<int>(settingId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (settingName.present) {
      map['setting_name'] = Variable<String>(settingName.value);
    }
    if (settingValue.present) {
      map['setting_value'] = Variable<String>(settingValue.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('settingId: $settingId, ')
          ..write('userId: $userId, ')
          ..write('settingName: $settingName, ')
          ..write('settingValue: $settingValue, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $ProfilesTable profiles = $ProfilesTable(this);
  late final $ChatsTable chats = $ChatsTable(this);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $ChatParticipantsTable chatParticipants =
      $ChatParticipantsTable(this);
  late final $MessageReadStatusesTable messageReadStatuses =
      $MessageReadStatusesTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $BlockedUsersTable blockedUsers = $BlockedUsersTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        profiles,
        chats,
        messages,
        chatParticipants,
        messageReadStatuses,
        attachments,
        blockedUsers,
        settings
      ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$ProfilesTableInsertCompanionBuilder = ProfilesCompanion Function({
  Value<String> id,
  required String username,
  Value<String?> profilePicture,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});
typedef $$ProfilesTableUpdateCompanionBuilder = ProfilesCompanion Function({
  Value<String> id,
  Value<String> username,
  Value<String?> profilePicture,
  Value<DateTime?> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> rowid,
});

class $$ProfilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProfilesTable,
    Profile,
    $$ProfilesTableFilterComposer,
    $$ProfilesTableOrderingComposer,
    $$ProfilesTableProcessedTableManager,
    $$ProfilesTableInsertCompanionBuilder,
    $$ProfilesTableUpdateCompanionBuilder> {
  $$ProfilesTableTableManager(_$AppDatabase db, $ProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProfilesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProfilesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ProfilesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String?> profilePicture = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProfilesCompanion(
            id: id,
            username: username,
            profilePicture: profilePicture,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            required String username,
            Value<String?> profilePicture = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProfilesCompanion.insert(
            id: id,
            username: username,
            profilePicture: profilePicture,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$ProfilesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ProfilesTable,
    Profile,
    $$ProfilesTableFilterComposer,
    $$ProfilesTableOrderingComposer,
    $$ProfilesTableProcessedTableManager,
    $$ProfilesTableInsertCompanionBuilder,
    $$ProfilesTableUpdateCompanionBuilder> {
  $$ProfilesTableProcessedTableManager(super.$state);
}

class $$ProfilesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get username => $state.composableBuilder(
      column: $state.table.username,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get profilePicture => $state.composableBuilder(
      column: $state.table.profilePicture,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter messagesRefs(
      ComposableFilter Function($$MessagesTableFilterComposer f) f) {
    final $$MessagesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.messages,
        getReferencedColumn: (t) => t.senderId,
        builder: (joinBuilder, parentComposers) =>
            $$MessagesTableFilterComposer(ComposerState(
                $state.db, $state.db.messages, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter chatParticipantsRefs(
      ComposableFilter Function($$ChatParticipantsTableFilterComposer f) f) {
    final $$ChatParticipantsTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.chatParticipants,
            getReferencedColumn: (t) => t.userId,
            builder: (joinBuilder, parentComposers) =>
                $$ChatParticipantsTableFilterComposer(ComposerState($state.db,
                    $state.db.chatParticipants, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter messageReadStatusesRefs(
      ComposableFilter Function($$MessageReadStatusesTableFilterComposer f) f) {
    final $$MessageReadStatusesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.messageReadStatuses,
            getReferencedColumn: (t) => t.userId,
            builder: (joinBuilder, parentComposers) =>
                $$MessageReadStatusesTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.messageReadStatuses,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }

  ComposableFilter blocker_id(
      ComposableFilter Function($$BlockedUsersTableFilterComposer f) f) {
    final $$BlockedUsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.blockedUsers,
        getReferencedColumn: (t) => t.blockerId,
        builder: (joinBuilder, parentComposers) =>
            $$BlockedUsersTableFilterComposer(ComposerState($state.db,
                $state.db.blockedUsers, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter blocked_id(
      ComposableFilter Function($$BlockedUsersTableFilterComposer f) f) {
    final $$BlockedUsersTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.blockedUsers,
        getReferencedColumn: (t) => t.blockedId,
        builder: (joinBuilder, parentComposers) =>
            $$BlockedUsersTableFilterComposer(ComposerState($state.db,
                $state.db.blockedUsers, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter settingsRefs(
      ComposableFilter Function($$SettingsTableFilterComposer f) f) {
    final $$SettingsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.settings,
        getReferencedColumn: (t) => t.userId,
        builder: (joinBuilder, parentComposers) =>
            $$SettingsTableFilterComposer(ComposerState(
                $state.db, $state.db.settings, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ProfilesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ProfilesTable> {
  $$ProfilesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get username => $state.composableBuilder(
      column: $state.table.username,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get profilePicture => $state.composableBuilder(
      column: $state.table.profilePicture,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ChatsTableInsertCompanionBuilder = ChatsCompanion Function({
  Value<String> id,
  Value<String?> chatName,
  required String chatType,
  Value<DateTime?> createdAt,
  Value<int> rowid,
});
typedef $$ChatsTableUpdateCompanionBuilder = ChatsCompanion Function({
  Value<String> id,
  Value<String?> chatName,
  Value<String> chatType,
  Value<DateTime?> createdAt,
  Value<int> rowid,
});

class $$ChatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChatsTable,
    Chat,
    $$ChatsTableFilterComposer,
    $$ChatsTableOrderingComposer,
    $$ChatsTableProcessedTableManager,
    $$ChatsTableInsertCompanionBuilder,
    $$ChatsTableUpdateCompanionBuilder> {
  $$ChatsTableTableManager(_$AppDatabase db, $ChatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChatsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChatsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$ChatsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String?> chatName = const Value.absent(),
            Value<String> chatType = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChatsCompanion(
            id: id,
            chatName: chatName,
            chatType: chatType,
            createdAt: createdAt,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String?> chatName = const Value.absent(),
            required String chatType,
            Value<DateTime?> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChatsCompanion.insert(
            id: id,
            chatName: chatName,
            chatType: chatType,
            createdAt: createdAt,
            rowid: rowid,
          ),
        ));
}

class $$ChatsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ChatsTable,
    Chat,
    $$ChatsTableFilterComposer,
    $$ChatsTableOrderingComposer,
    $$ChatsTableProcessedTableManager,
    $$ChatsTableInsertCompanionBuilder,
    $$ChatsTableUpdateCompanionBuilder> {
  $$ChatsTableProcessedTableManager(super.$state);
}

class $$ChatsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChatsTable> {
  $$ChatsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get chatName => $state.composableBuilder(
      column: $state.table.chatName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get chatType => $state.composableBuilder(
      column: $state.table.chatType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter messagesRefs(
      ComposableFilter Function($$MessagesTableFilterComposer f) f) {
    final $$MessagesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.messages,
        getReferencedColumn: (t) => t.chatId,
        builder: (joinBuilder, parentComposers) =>
            $$MessagesTableFilterComposer(ComposerState(
                $state.db, $state.db.messages, joinBuilder, parentComposers)));
    return f(composer);
  }

  ComposableFilter chatParticipantsRefs(
      ComposableFilter Function($$ChatParticipantsTableFilterComposer f) f) {
    final $$ChatParticipantsTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.chatParticipants,
            getReferencedColumn: (t) => t.chatId,
            builder: (joinBuilder, parentComposers) =>
                $$ChatParticipantsTableFilterComposer(ComposerState($state.db,
                    $state.db.chatParticipants, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ChatsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChatsTable> {
  $$ChatsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get chatName => $state.composableBuilder(
      column: $state.table.chatName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get chatType => $state.composableBuilder(
      column: $state.table.chatType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MessagesTableInsertCompanionBuilder = MessagesCompanion Function({
  Value<String> id,
  required String chatId,
  required String senderId,
  required String content,
  required String messageType,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$MessagesTableUpdateCompanionBuilder = MessagesCompanion Function({
  Value<String> id,
  Value<String> chatId,
  Value<String> senderId,
  Value<String> content,
  Value<String> messageType,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$MessagesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MessagesTable,
    Message,
    $$MessagesTableFilterComposer,
    $$MessagesTableOrderingComposer,
    $$MessagesTableProcessedTableManager,
    $$MessagesTableInsertCompanionBuilder,
    $$MessagesTableUpdateCompanionBuilder> {
  $$MessagesTableTableManager(_$AppDatabase db, $MessagesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MessagesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MessagesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MessagesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String> chatId = const Value.absent(),
            Value<String> senderId = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String> messageType = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MessagesCompanion(
            id: id,
            chatId: chatId,
            senderId: senderId,
            content: content,
            messageType: messageType,
            createdAt: createdAt,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            required String chatId,
            required String senderId,
            required String content,
            required String messageType,
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MessagesCompanion.insert(
            id: id,
            chatId: chatId,
            senderId: senderId,
            content: content,
            messageType: messageType,
            createdAt: createdAt,
            rowid: rowid,
          ),
        ));
}

class $$MessagesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $MessagesTable,
    Message,
    $$MessagesTableFilterComposer,
    $$MessagesTableOrderingComposer,
    $$MessagesTableProcessedTableManager,
    $$MessagesTableInsertCompanionBuilder,
    $$MessagesTableUpdateCompanionBuilder> {
  $$MessagesTableProcessedTableManager(super.$state);
}

class $$MessagesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get messageType => $state.composableBuilder(
      column: $state.table.messageType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ChatsTableFilterComposer get chatId {
    final $$ChatsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.chatId,
        referencedTable: $state.db.chats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ChatsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.chats, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProfilesTableFilterComposer get senderId {
    final $$ProfilesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.senderId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableFilterComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter messageReadStatusesRefs(
      ComposableFilter Function($$MessageReadStatusesTableFilterComposer f) f) {
    final $$MessageReadStatusesTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.messageReadStatuses,
            getReferencedColumn: (t) => t.messageId,
            builder: (joinBuilder, parentComposers) =>
                $$MessageReadStatusesTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.messageReadStatuses,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }

  ComposableFilter attachmentsRefs(
      ComposableFilter Function($$AttachmentsTableFilterComposer f) f) {
    final $$AttachmentsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.attachments,
        getReferencedColumn: (t) => t.messageId,
        builder: (joinBuilder, parentComposers) =>
            $$AttachmentsTableFilterComposer(ComposerState($state.db,
                $state.db.attachments, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$MessagesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MessagesTable> {
  $$MessagesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get messageType => $state.composableBuilder(
      column: $state.table.messageType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ChatsTableOrderingComposer get chatId {
    final $$ChatsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.chatId,
        referencedTable: $state.db.chats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ChatsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.chats, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProfilesTableOrderingComposer get senderId {
    final $$ProfilesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.senderId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableOrderingComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$ChatParticipantsTableInsertCompanionBuilder
    = ChatParticipantsCompanion Function({
  required String chatId,
  required String userId,
  Value<DateTime?> joinedAt,
  Value<int> rowid,
});
typedef $$ChatParticipantsTableUpdateCompanionBuilder
    = ChatParticipantsCompanion Function({
  Value<String> chatId,
  Value<String> userId,
  Value<DateTime?> joinedAt,
  Value<int> rowid,
});

class $$ChatParticipantsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChatParticipantsTable,
    ChatParticipant,
    $$ChatParticipantsTableFilterComposer,
    $$ChatParticipantsTableOrderingComposer,
    $$ChatParticipantsTableProcessedTableManager,
    $$ChatParticipantsTableInsertCompanionBuilder,
    $$ChatParticipantsTableUpdateCompanionBuilder> {
  $$ChatParticipantsTableTableManager(
      _$AppDatabase db, $ChatParticipantsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ChatParticipantsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ChatParticipantsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ChatParticipantsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> chatId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<DateTime?> joinedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChatParticipantsCompanion(
            chatId: chatId,
            userId: userId,
            joinedAt: joinedAt,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String chatId,
            required String userId,
            Value<DateTime?> joinedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChatParticipantsCompanion.insert(
            chatId: chatId,
            userId: userId,
            joinedAt: joinedAt,
            rowid: rowid,
          ),
        ));
}

class $$ChatParticipantsTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $ChatParticipantsTable,
        ChatParticipant,
        $$ChatParticipantsTableFilterComposer,
        $$ChatParticipantsTableOrderingComposer,
        $$ChatParticipantsTableProcessedTableManager,
        $$ChatParticipantsTableInsertCompanionBuilder,
        $$ChatParticipantsTableUpdateCompanionBuilder> {
  $$ChatParticipantsTableProcessedTableManager(super.$state);
}

class $$ChatParticipantsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ChatParticipantsTable> {
  $$ChatParticipantsTableFilterComposer(super.$state);
  ColumnFilters<DateTime> get joinedAt => $state.composableBuilder(
      column: $state.table.joinedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ChatsTableFilterComposer get chatId {
    final $$ChatsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.chatId,
        referencedTable: $state.db.chats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ChatsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.chats, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProfilesTableFilterComposer get userId {
    final $$ProfilesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableFilterComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ChatParticipantsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ChatParticipantsTable> {
  $$ChatParticipantsTableOrderingComposer(super.$state);
  ColumnOrderings<DateTime> get joinedAt => $state.composableBuilder(
      column: $state.table.joinedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ChatsTableOrderingComposer get chatId {
    final $$ChatsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.chatId,
        referencedTable: $state.db.chats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) => $$ChatsTableOrderingComposer(
            ComposerState(
                $state.db, $state.db.chats, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProfilesTableOrderingComposer get userId {
    final $$ProfilesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableOrderingComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$MessageReadStatusesTableInsertCompanionBuilder
    = MessageReadStatusesCompanion Function({
  Value<String> id,
  required String messageId,
  required String userId,
  Value<bool> isRead,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$MessageReadStatusesTableUpdateCompanionBuilder
    = MessageReadStatusesCompanion Function({
  Value<String> id,
  Value<String> messageId,
  Value<String> userId,
  Value<bool> isRead,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$MessageReadStatusesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MessageReadStatusesTable,
    MessageReadStatus,
    $$MessageReadStatusesTableFilterComposer,
    $$MessageReadStatusesTableOrderingComposer,
    $$MessageReadStatusesTableProcessedTableManager,
    $$MessageReadStatusesTableInsertCompanionBuilder,
    $$MessageReadStatusesTableUpdateCompanionBuilder> {
  $$MessageReadStatusesTableTableManager(
      _$AppDatabase db, $MessageReadStatusesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$MessageReadStatusesTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$MessageReadStatusesTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$MessageReadStatusesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String> messageId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<bool> isRead = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MessageReadStatusesCompanion(
            id: id,
            messageId: messageId,
            userId: userId,
            isRead: isRead,
            createdAt: createdAt,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            required String messageId,
            required String userId,
            Value<bool> isRead = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MessageReadStatusesCompanion.insert(
            id: id,
            messageId: messageId,
            userId: userId,
            isRead: isRead,
            createdAt: createdAt,
            rowid: rowid,
          ),
        ));
}

class $$MessageReadStatusesTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $MessageReadStatusesTable,
        MessageReadStatus,
        $$MessageReadStatusesTableFilterComposer,
        $$MessageReadStatusesTableOrderingComposer,
        $$MessageReadStatusesTableProcessedTableManager,
        $$MessageReadStatusesTableInsertCompanionBuilder,
        $$MessageReadStatusesTableUpdateCompanionBuilder> {
  $$MessageReadStatusesTableProcessedTableManager(super.$state);
}

class $$MessageReadStatusesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MessageReadStatusesTable> {
  $$MessageReadStatusesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isRead => $state.composableBuilder(
      column: $state.table.isRead,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$MessagesTableFilterComposer get messageId {
    final $$MessagesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.messageId,
        referencedTable: $state.db.messages,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MessagesTableFilterComposer(ComposerState(
                $state.db, $state.db.messages, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProfilesTableFilterComposer get userId {
    final $$ProfilesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableFilterComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$MessageReadStatusesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MessageReadStatusesTable> {
  $$MessageReadStatusesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isRead => $state.composableBuilder(
      column: $state.table.isRead,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$MessagesTableOrderingComposer get messageId {
    final $$MessagesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.messageId,
        referencedTable: $state.db.messages,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MessagesTableOrderingComposer(ComposerState(
                $state.db, $state.db.messages, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProfilesTableOrderingComposer get userId {
    final $$ProfilesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableOrderingComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$AttachmentsTableInsertCompanionBuilder = AttachmentsCompanion
    Function({
  Value<int?> attachmentId,
  required String messageId,
  required String filePath,
  required String fileType,
  Value<DateTime?> createdAt,
});
typedef $$AttachmentsTableUpdateCompanionBuilder = AttachmentsCompanion
    Function({
  Value<int?> attachmentId,
  Value<String> messageId,
  Value<String> filePath,
  Value<String> fileType,
  Value<DateTime?> createdAt,
});

class $$AttachmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AttachmentsTable,
    Attachment,
    $$AttachmentsTableFilterComposer,
    $$AttachmentsTableOrderingComposer,
    $$AttachmentsTableProcessedTableManager,
    $$AttachmentsTableInsertCompanionBuilder,
    $$AttachmentsTableUpdateCompanionBuilder> {
  $$AttachmentsTableTableManager(_$AppDatabase db, $AttachmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AttachmentsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AttachmentsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$AttachmentsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int?> attachmentId = const Value.absent(),
            Value<String> messageId = const Value.absent(),
            Value<String> filePath = const Value.absent(),
            Value<String> fileType = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              AttachmentsCompanion(
            attachmentId: attachmentId,
            messageId: messageId,
            filePath: filePath,
            fileType: fileType,
            createdAt: createdAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int?> attachmentId = const Value.absent(),
            required String messageId,
            required String filePath,
            required String fileType,
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              AttachmentsCompanion.insert(
            attachmentId: attachmentId,
            messageId: messageId,
            filePath: filePath,
            fileType: fileType,
            createdAt: createdAt,
          ),
        ));
}

class $$AttachmentsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $AttachmentsTable,
    Attachment,
    $$AttachmentsTableFilterComposer,
    $$AttachmentsTableOrderingComposer,
    $$AttachmentsTableProcessedTableManager,
    $$AttachmentsTableInsertCompanionBuilder,
    $$AttachmentsTableUpdateCompanionBuilder> {
  $$AttachmentsTableProcessedTableManager(super.$state);
}

class $$AttachmentsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableFilterComposer(super.$state);
  ColumnFilters<int> get attachmentId => $state.composableBuilder(
      column: $state.table.attachmentId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get filePath => $state.composableBuilder(
      column: $state.table.filePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get fileType => $state.composableBuilder(
      column: $state.table.fileType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$MessagesTableFilterComposer get messageId {
    final $$MessagesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.messageId,
        referencedTable: $state.db.messages,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MessagesTableFilterComposer(ComposerState(
                $state.db, $state.db.messages, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$AttachmentsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $AttachmentsTable> {
  $$AttachmentsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get attachmentId => $state.composableBuilder(
      column: $state.table.attachmentId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get filePath => $state.composableBuilder(
      column: $state.table.filePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get fileType => $state.composableBuilder(
      column: $state.table.fileType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$MessagesTableOrderingComposer get messageId {
    final $$MessagesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.messageId,
        referencedTable: $state.db.messages,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$MessagesTableOrderingComposer(ComposerState(
                $state.db, $state.db.messages, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$BlockedUsersTableInsertCompanionBuilder = BlockedUsersCompanion
    Function({
  required String blockerId,
  required String blockedId,
  Value<DateTime?> blockedAt,
  Value<int> rowid,
});
typedef $$BlockedUsersTableUpdateCompanionBuilder = BlockedUsersCompanion
    Function({
  Value<String> blockerId,
  Value<String> blockedId,
  Value<DateTime?> blockedAt,
  Value<int> rowid,
});

class $$BlockedUsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BlockedUsersTable,
    BlockedUser,
    $$BlockedUsersTableFilterComposer,
    $$BlockedUsersTableOrderingComposer,
    $$BlockedUsersTableProcessedTableManager,
    $$BlockedUsersTableInsertCompanionBuilder,
    $$BlockedUsersTableUpdateCompanionBuilder> {
  $$BlockedUsersTableTableManager(_$AppDatabase db, $BlockedUsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BlockedUsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$BlockedUsersTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$BlockedUsersTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> blockerId = const Value.absent(),
            Value<String> blockedId = const Value.absent(),
            Value<DateTime?> blockedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BlockedUsersCompanion(
            blockerId: blockerId,
            blockedId: blockedId,
            blockedAt: blockedAt,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required String blockerId,
            required String blockedId,
            Value<DateTime?> blockedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BlockedUsersCompanion.insert(
            blockerId: blockerId,
            blockedId: blockedId,
            blockedAt: blockedAt,
            rowid: rowid,
          ),
        ));
}

class $$BlockedUsersTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $BlockedUsersTable,
    BlockedUser,
    $$BlockedUsersTableFilterComposer,
    $$BlockedUsersTableOrderingComposer,
    $$BlockedUsersTableProcessedTableManager,
    $$BlockedUsersTableInsertCompanionBuilder,
    $$BlockedUsersTableUpdateCompanionBuilder> {
  $$BlockedUsersTableProcessedTableManager(super.$state);
}

class $$BlockedUsersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BlockedUsersTable> {
  $$BlockedUsersTableFilterComposer(super.$state);
  ColumnFilters<DateTime> get blockedAt => $state.composableBuilder(
      column: $state.table.blockedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProfilesTableFilterComposer get blockerId {
    final $$ProfilesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.blockerId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableFilterComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProfilesTableFilterComposer get blockedId {
    final $$ProfilesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.blockedId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableFilterComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$BlockedUsersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BlockedUsersTable> {
  $$BlockedUsersTableOrderingComposer(super.$state);
  ColumnOrderings<DateTime> get blockedAt => $state.composableBuilder(
      column: $state.table.blockedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProfilesTableOrderingComposer get blockerId {
    final $$ProfilesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.blockerId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableOrderingComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProfilesTableOrderingComposer get blockedId {
    final $$ProfilesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.blockedId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableOrderingComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$SettingsTableInsertCompanionBuilder = SettingsCompanion Function({
  Value<int> settingId,
  required String userId,
  required String settingName,
  required String settingValue,
  Value<DateTime?> updatedAt,
});
typedef $$SettingsTableUpdateCompanionBuilder = SettingsCompanion Function({
  Value<int> settingId,
  Value<String> userId,
  Value<String> settingName,
  Value<String> settingValue,
  Value<DateTime?> updatedAt,
});

class $$SettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableProcessedTableManager,
    $$SettingsTableInsertCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder> {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SettingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SettingsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$SettingsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> settingId = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> settingName = const Value.absent(),
            Value<String> settingValue = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              SettingsCompanion(
            settingId: settingId,
            userId: userId,
            settingName: settingName,
            settingValue: settingValue,
            updatedAt: updatedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> settingId = const Value.absent(),
            required String userId,
            required String settingName,
            required String settingValue,
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              SettingsCompanion.insert(
            settingId: settingId,
            userId: userId,
            settingName: settingName,
            settingValue: settingValue,
            updatedAt: updatedAt,
          ),
        ));
}

class $$SettingsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $SettingsTable,
    Setting,
    $$SettingsTableFilterComposer,
    $$SettingsTableOrderingComposer,
    $$SettingsTableProcessedTableManager,
    $$SettingsTableInsertCompanionBuilder,
    $$SettingsTableUpdateCompanionBuilder> {
  $$SettingsTableProcessedTableManager(super.$state);
}

class $$SettingsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer(super.$state);
  ColumnFilters<int> get settingId => $state.composableBuilder(
      column: $state.table.settingId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get settingName => $state.composableBuilder(
      column: $state.table.settingName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get settingValue => $state.composableBuilder(
      column: $state.table.settingValue,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProfilesTableFilterComposer get userId {
    final $$ProfilesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableFilterComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$SettingsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get settingId => $state.composableBuilder(
      column: $state.table.settingId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get settingName => $state.composableBuilder(
      column: $state.table.settingName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get settingValue => $state.composableBuilder(
      column: $state.table.settingValue,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProfilesTableOrderingComposer get userId {
    final $$ProfilesTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.userId,
        referencedTable: $state.db.profiles,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProfilesTableOrderingComposer(ComposerState(
                $state.db, $state.db.profiles, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$ProfilesTableTableManager get profiles =>
      $$ProfilesTableTableManager(_db, _db.profiles);
  $$ChatsTableTableManager get chats =>
      $$ChatsTableTableManager(_db, _db.chats);
  $$MessagesTableTableManager get messages =>
      $$MessagesTableTableManager(_db, _db.messages);
  $$ChatParticipantsTableTableManager get chatParticipants =>
      $$ChatParticipantsTableTableManager(_db, _db.chatParticipants);
  $$MessageReadStatusesTableTableManager get messageReadStatuses =>
      $$MessageReadStatusesTableTableManager(_db, _db.messageReadStatuses);
  $$AttachmentsTableTableManager get attachments =>
      $$AttachmentsTableTableManager(_db, _db.attachments);
  $$BlockedUsersTableTableManager get blockedUsers =>
      $$BlockedUsersTableTableManager(_db, _db.blockedUsers);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}
