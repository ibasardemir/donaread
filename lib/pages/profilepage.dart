import 'package:flutter/material.dart';
import '../managers/profilemanager.dart';
import "../datas/profile.dart";
import '../auth.dart';

class ProfilePage extends StatelessWidget {
  int booksshared;
  int bookstaken;
  int booksdonated;
  int tokens;
  Profile prof = Profilemanager.profile ?? Profile("null", "0", "location");
  String profileImageUrl;
  double savedpapers = 0.9;
  double savedcarbonemission = 1.125;
  double savedwater = 11.25;

  ProfilePage({
    super.key,
    this.booksshared = 0,
    this.bookstaken = 50,
    this.booksdonated = 233,
    this.tokens = 20,
    this.profileImageUrl =
        'https://www.dlf.pt/dfpng/middlepng/247-2479526_round-profile-picture-png-transparent-png.png',
  }) {
    booksdonated = prof.booksdonated;
    booksshared = prof.booksshared;
    bookstaken = prof.bookstaken;
    tokens = prof.token;
  }

  @override
  Widget build(BuildContext context) {
    final int totalbook = booksdonated + booksshared;
    return Scaffold(
      //onPressed: () => Auth().signOut(),

      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(Icons.output, color: Colors.black),
                    onPressed: () => Auth().signOut()),

                SizedBox(width: 16.0), // Add a SizedBox with a width of 16.0
              ],
            ),
          ),
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
          Row(
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
                        "\n     ${savedpapers * totalbook} "
                        'kg papers are saved',
                        style: const TextStyle(fontSize: 18)),
                    Text(
                        "\n     ${savedcarbonemission * totalbook} "
                        'kg of CO2 emission is prevented',
                        style: const TextStyle(fontSize: 18)),
                    Text(
                        "\n     ${savedcarbonemission * totalbook} "
                        'L of industrial water is prevented',
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
