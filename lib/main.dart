import 'package:chat_app/chat_detail_screen.dart';
import 'package:chat_app/database.dart';
import 'package:chat_app/models.dart';
import 'package:chat_app/powersync.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await openDatabase();
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter + Supabase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  Profile? profile;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    fetchProfile();
    super.initState();
  }

  void fetchProfile() async {
    final profile = await appDb.getProfileById(supabase.auth.currentUser!.id);
    setState(() => this.profile = profile);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(profile?.username ?? ""),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            // onTap:  (int index) => _tabController.animateTo(index),
            tabs: const [
              Text('Chat'),
              Text('Group'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            ChatListScreen(),
            GroupsScreen(),
          ],
        ),
      ),
    );
  }
}

enum ChatType { private, group }

class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> with AutomaticKeepAliveClientMixin<GroupsScreen> {
  List<Chat> groups = [];

  @override
  void initState() {
    fetchGroups();
    super.initState();
  }

  void fetchGroups() async {
    final response = await appDb.getAllGroups();

    // final response = await supabase.from('chats').select().eq('chat_type', 'group');
    // final groupModels = response.map((e) => ChatModel.fromJson(e)).toList();
    setState(() => groups = response);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final response = await appDb.chats
          //     .insertReturning(ChatsCompanion.insert(chatType: 'group', chatName: Value("Bob's group")));
          // print(response);
          // fetchGroups();
          // logout();
          supabase.auth.signInWithPassword(password: '123456', email: 'b@b.com');
          // print(response);
          // supabase.auth.signUp(
          //   password: '123456',
          //   email: 'b@b.com',
          //   data: {'username': 'Bob'},
          // );
        },
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailScreen(chat: groups[index]))),
            title: Text(groups[index].chatName ?? ''),
            // trailing: FutureBuilder(
            //   future: appDb.countUnreadMessages(groups[index].id, supabase.auth.currentUser!.id),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       final count = snapshot.data as int;
            //       return Text('$count');
            //     }
            //     return const SizedBox();
            //   },
            // ),
          );
        },
        itemCount: groups.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List<Chat> chats = [];

  @override
  void initState() {
    fetchChats();
    super.initState();
  }

  void fetchChats() async {
    // final response = await supabase.from('chats').select().eq('chat_type', 'private');
    // print(response);
    // final chatModels = response.map((e) => ChatModel.fromJson(e)).toList();
    // setState(() => chats = chatModels);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailScreen(chat: chats[index])));
            },
            // child: Text(chats[index].chatName),
          );
        },
        itemCount: chats.length,
      ),
    );
  }
}
