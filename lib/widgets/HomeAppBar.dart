import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          const Icon(
            Icons.sort,
            size: 30,
            color: Color(0xFF1C4997),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'LitMall',
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C4997)),
            ),
          ),
          const Spacer(),
          badges.Badge(
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Color.fromARGB(255, 0, 0, 0),
              padding: EdgeInsets.all(7),
            ),
            badgeContent: const Text(
              '2',
              style: TextStyle(color: Colors.white),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/Chatpage');
              },
              child: const Icon(
                Icons.message_outlined,
                size: 32,
                color: Color(0xFF1C4997),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
