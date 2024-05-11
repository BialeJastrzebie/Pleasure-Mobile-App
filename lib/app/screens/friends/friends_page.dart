import 'package:flutter/material.dart';
import '/app/shared/utils/base_view.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  FriendsPageState createState() => FriendsPageState();
}

class FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return const BaseView(
        body: Center(
          child: Text('FriendsPage goes here'),
        )
    );
  }
}
