import 'package:powersync/powersync.dart';

const schema = Schema([
  Table('chats', [
    Column.text('chat_name'),
    Column.text('chat_type'),
    Column.text('created_at')
  ]),
  Table('messages', [
    Column.text('sender_id'),
    Column.text('content'),
    Column.text('message_type'),
    Column.text('created_at'),
    Column.text('chat_id')
  ]),
  Table('profile', [
    Column.text('username'),
    Column.text('profile_picture'),
    Column.text('created_at'),
    Column.text('updated_at')
  ]),
  Table('settings', [
    Column.text('user_id'),
    Column.text('setting_name'),
    Column.text('setting_value'),
    Column.text('updated_at')
  ]),
  Table('message_read_status', [
    Column.text('user_id'),
    Column.integer('is_read'),
    Column.text('created_at'),
    Column.text('message_id')
  ])
]);




