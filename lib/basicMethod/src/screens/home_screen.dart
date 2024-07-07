import 'package:flutter/material.dart';
import 'package:rest_api/basicMethod/src/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _users = [];

  Future<void> _fetchUser() async {
    final tempInfo = await UserApi.fetchUser();

    setState(() {
      _users = tempInfo;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random users'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final userInfo = _users[index];

          final name = userInfo['name']['first'];
          final email = userInfo['email'] ?? '';
          final imgUrl = userInfo['picture']['thumbnail'];

          return ListTile(
            leading: ClipOval(child: Image.network(imgUrl)),
            title: Text(name),
            subtitle: Text(email),
          );
        },
      ),
    );
  }
}
