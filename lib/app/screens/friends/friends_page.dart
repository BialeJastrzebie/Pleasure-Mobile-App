import 'package:flutter/material.dart';
import 'package:pleasure_mobile_app/app/shared/widgets/base_view.dart';
import 'package:pleasure_mobile_app/app/shared/themes/theme.dart';
import 'friends_invites.dart';
import 'friends_my.dart';
class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  FriendsPageState createState() => FriendsPageState();
}

class FriendsPageState extends State<FriendsPage> {
  void _onZaproszeniaPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FriendsInvitesPage()), // Added navigation to FriendInvitesPage
    );
  }
  void _onTwoiZnajomiPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyFriendsPage()), // Added navigation to MyFriendsPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: Container(
        color: backgroundColor, // Ustawienie tła na ciemnoczerwony
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.grey,
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: _onZaproszeniaPressed,
                    child: const Text('Zaproszenia'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.grey,
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: _onTwoiZnajomiPressed,
                    child: const Text('Twoi znajomi'),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Osoby, które możesz znać:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: const [
                  FriendCard(name: 'Jan Kaczmarek'),
                  FriendCard(name: 'Kacper Błoński'),
                  FriendCard(name: 'Arkadiusz Tańcula'),
                  FriendCard(name: 'Amadeusz Roślik'),
                  FriendCard(name: 'Marcin Majkut'),
                  FriendCard(name: 'Piotr Węgrzyn'),
                  FriendCard(name: 'Krystian Juszczyk'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FriendInvitesPage {
  const FriendInvitesPage();
}

class FriendCard extends StatelessWidget {
  final String name;

  const FriendCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_circle,
                size: 40,
                color: Colors.grey,
              ),
              const SizedBox(width: 10.0),
              Text(
                name,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: const Icon(
                Icons.send,
                color: Colors.green,
              ),
            ),
            onPressed: () {
              // Akcja po naciśnięciu ikony wysyłania wiadomości
            },
          ),
        ],
      ),
    );
  }
}
