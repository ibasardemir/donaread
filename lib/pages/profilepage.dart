
import 'package:flutter/material.dart';
import '../managers/profilemanager.dart';
class ProfilePage extends StatelessWidget {
  final int booksshared;
  final int bookstaken;
  final int booksdonated;
  final int tokens;
  final String profileImageUrl;
  int savedpapers = 10;
  double savedcarbonemission = 0.5;
  double savedwater = 2.4;

  ProfilePage({super.key, 
    this.booksshared = 100,
    this.bookstaken = 50,
    this.booksdonated = 233,
    this.tokens = 20,
    this.profileImageUrl =
        'https://www.dlf.pt/dfpng/middlepng/247-2479526_round-profile-picture-png-transparent-png.png',
  });

  @override
  Widget build(BuildContext context) {
    final int totalbook = booksdonated + booksshared;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // changed to center
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(profileImageUrl),
                ),
                const SizedBox(width: 16.0), // added SizedBox to add some space
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    'Tokens: $tokens',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Books shared',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('$booksshared'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Books taken',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('$bookstaken'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Books donated',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('$booksdonated'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // add this line
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '\n   You Saved!',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                          "\n     ${savedpapers * totalbook} " 'papers are saved',
                          style: const TextStyle(fontSize: 18)),
                      Text(
                          "\n     ${savedcarbonemission * totalbook} " 'kg of CO2 emission is prevented',
                          style: const TextStyle(fontSize: 18)),
                      Text(
                          "\n     ${savedcarbonemission * totalbook} " 'L of industrial water is prevented',
                          style: const TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
