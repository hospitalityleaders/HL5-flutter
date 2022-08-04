import 'package:flutter/material.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/providers/app_provider.dart';
import 'package:holedo/utils/validator.dart';
import 'package:routemaster/routemaster.dart';

import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  final double breakpoint = 800;
  final int paneProportion = 78;
  @override
  Widget build(BuildContext context) {
    final stackState = StackPage.of(context).stack;
    final appState = Provider.of<AppProvider>(context, listen: false);

    appState.matrix.onLoginStateChanged.stream.listen((loginState) {
      print("LoginState: ${loginState.toString()}");
    });

    //appState.matrix.onEvent.stream.listen((EventUpdate eventUpdate) {
    //  print("New event update!");
    // });

    //appState.matrix.onRoomUpdate.stream.listen((RoomUpdate eventUpdate) {
    // print("New room update!");
    // });
    return PageScaffold(
      title: 'Holedo Chat',
      body: Flex(
        direction: Axis.horizontal,
        children: [
          appState.matrix.isLogged()
              ? Flexible(
                  flex: 100 - paneProportion,
                  child: const RoomListPage(),
                )
              : Container(),
          Flexible(
            flex: paneProportion,
            child: PageStackNavigator(stack: StackPage.of(context).stack),
          ),
        ],
      ),
    );
  }
}

class LoginChatPage extends StatelessWidget {
  const LoginChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('LoginChatPage'),
    );
  }
}

class RoomsChatPage extends StatelessWidget {
  const RoomsChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = Provider.of<AppProvider>(context, listen: false).matrix;

    return Scaffold(
      body: Text('RoomsChatPage'),
    );
  }
}

class ChatLoginPage extends StatefulWidget {
  const ChatLoginPage({Key? key}) : super(key: key);

  @override
  _ChatLoginPageState createState() => _ChatLoginPageState();
}

class _ChatLoginPageState extends State<ChatLoginPage> {
  final TextEditingController _homeserverTextField = TextEditingController(
    text: 'holedo.com',
  );
  final TextEditingController _usernameTextField = TextEditingController();
  final TextEditingController _passwordTextField = TextEditingController();

  bool _loading = false;

  void _login() async {
    setState(() {
      _loading = true;
    });

    try {
      final client = Provider.of<AppProvider>(context, listen: false).matrix;
      await client
          .checkHomeserver(Uri.https(_homeserverTextField.text.trim(), ''));
      await client.login(
        LoginType.mLoginPassword,
        password: _passwordTextField.text,
        identifier: AuthenticationUserIdentifier(user: _usernameTextField.text),
      );
      Routemaster.of(context).push('/chat/rooms/');
      //Navigator.of(context).pushAndRemoveUntil(
      //    MaterialPageRoute(builder: (_) => const RoomListPage()),
      //  (route) => false,
      //);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _homeserverTextField,
              readOnly: _loading,
              autocorrect: false,
              decoration: const InputDecoration(
                prefixText: 'https://',
                border: OutlineInputBorder(),
                labelText: 'Homeserver',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _usernameTextField,
              readOnly: _loading,
              autocorrect: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordTextField,
              readOnly: _loading,
              autocorrect: false,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _loading ? null : _login,
                child: _loading
                    ? const LinearProgressIndicator()
                    : const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomListPage extends StatefulWidget {
  const RoomListPage({Key? key}) : super(key: key);

  @override
  _RoomListPageState createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  void _logout() async {
    final client = Provider.of<AppProvider>(context, listen: false).matrix;
    await client.logout();
    //Navigator.of(context).pushAndRemoveUntil(
    //  MaterialPageRoute(builder: (_) => const ChatLoginPage()),
    // (route) => false,
    //);
    Routemaster.of(context).push('/chat/login/');
  }

  void _join(Room room) async {
    print('Room: ${room.id.toString()} ${room.toJson().toString()}');
    if (room == null) {
      return;
    }
    if (room.membership != Membership.join) {
      await room.join();
    }

    Routemaster.of(context).push('/chat/room/${room.id}');
    //Navigator.of(context).push(
    //  MaterialPageRoute(
    //    builder: (_) => RoomPage(room: room),
    //   ),
    //;
  }

  @override
  Widget build(BuildContext context) {
    final client = Provider.of<AppProvider>(context, listen: false).matrix;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: client.onSync.stream,
        builder: (context, _) => ListView.builder(
          itemCount: client.rooms.length,
          itemBuilder: (context, i) => ListTile(
            leading: CircleAvatar(
              foregroundImage: client.rooms[i].avatar == null
                  ? null
                  : NetworkImage(client.rooms[i].avatar!
                      .getThumbnail(
                        client,
                        width: 56,
                        height: 56,
                      )
                      .toString()),
            ),
            title: Row(
              children: [
                Expanded(child: Text(client.rooms[i].displayname)),
                if (client.rooms[i].notificationCount > 0)
                  Material(
                      borderRadius: BorderRadius.circular(99),
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child:
                            Text(client.rooms[i].notificationCount.toString()),
                      ))
              ],
            ),
            subtitle: Text(
              client.rooms[i].lastEvent?.body ?? 'No messages',
              maxLines: 1,
            ),
            onTap: () => _join(client.rooms[i]),
          ),
        ),
      ),
    );
  }
}

class RoomPage extends StatefulWidget {
  final Room room;
  const RoomPage({required this.room, Key? key}) : super(key: key);

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  late final Future<Timeline> _timelineFuture;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  int _count = 0;

  @override
  void initState() {
    _timelineFuture = widget.room.getTimeline(onChange: (i) {
      print('on change! $i');
      _listKey.currentState?.setState(() {});
    }, onInsert: (i) {
      print('on insert! $i');
      _listKey.currentState?.insertItem(i);
      _count++;
    }, onRemove: (i) {
      print('On remove $i');
      _count--;
      _listKey.currentState?.removeItem(i, (_, __) => const ListTile());
    }, onUpdate: () {
      print('On update');
    });
    super.initState();
  }

  final TextEditingController _sendController = TextEditingController();

  void _send() {
    widget.room.sendTextEvent(_sendController.text.trim());
    _sendController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.displayname),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<Timeline>(
                future: _timelineFuture,
                builder: (context, snapshot) {
                  final timeline = snapshot.data;
                  if (timeline == null) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  _count = timeline.events.length;
                  return Column(
                    children: [
                      Center(
                        child: TextButton(
                            onPressed: timeline.requestHistory,
                            child: const Text('Load more...')),
                      ),
                      const Divider(height: 1),
                      Expanded(
                        child: AnimatedList(
                          key: _listKey,
                          reverse: true,
                          initialItemCount: timeline.events.length,
                          itemBuilder: (context, i, animation) => timeline
                                      .events[i].relationshipEventId !=
                                  null
                              ? Container()
                              : ScaleTransition(
                                  scale: animation,
                                  child: Opacity(
                                    opacity: timeline.events[i].status.isSent
                                        ? 1
                                        : 0.5,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        foregroundImage: timeline.events[i]
                                                    .sender.avatarUrl ==
                                                null
                                            ? null
                                            : NetworkImage(timeline
                                                .events[i].sender.avatarUrl!
                                                .getThumbnail(
                                                  widget.room.client,
                                                  width: 56,
                                                  height: 56,
                                                )
                                                .toString()),
                                      ),
                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: Text(timeline
                                                .events[i].sender
                                                .calcDisplayname()),
                                          ),
                                          Text(
                                            timeline.events[i].originServerTs
                                                .toIso8601String(),
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      subtitle: Text(timeline.events[i]
                                          .getDisplayEvent(timeline)
                                          .body),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _sendController,
                    decoration: const InputDecoration(
                      hintText: 'Send message',
                    ),
                  )),
                  IconButton(
                    icon: const Icon(Icons.send_outlined),
                    onPressed: _send,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
